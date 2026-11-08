const assert = require('node:assert/strict');
const { readFileSync } = require('node:fs');
const { test } = require('node:test');
const vm = require('node:vm');

// Exercise the actual inline loader with a deterministic clock, including
// fast startup where a timer-based minimum used to keep the page covered.
const html = readFileSync(new URL('../web/index.html', `file://${__filename}`), 'utf8');
const source = [...html.matchAll(/<script>([\s\S]*?)<\/script>/g)].at(-1)[1];

function loader() {
  const classes = new Set();
  const bodyClasses = new Set();
  const attributes = {};
  const timers = [];
  let tick;
  let ready;
  let removed = false;
  let cleared = false;
  const screen = {
    classList: { add: (name) => classes.add(name) },
    setAttribute: (name, value) => { attributes[name] = value; },
    remove: () => { removed = true; },
  };
  const value = { firstChild: { nodeValue: '1' } };
  const fill = { style: {} };
  const elements = { 'loading-screen': screen, 'loading-value': value, 'loading-fill': fill };
  vm.runInNewContext(source, {
    document: {
      getElementById: (id) => elements[id],
      body: { classList: { add: (name) => bodyClasses.add(name) } },
    },
    window: { addEventListener: (name, callback) => {
      assert.equal(name, 'flutter-first-frame');
      ready = callback;
    } },
    performance: { mark() {} },
    setInterval: (callback) => { tick = callback; return 1; },
    clearInterval: () => { cleared = true; },
    setTimeout: (callback, delay) => timers.push({ callback, delay }),
  });
  return {
    classes, attributes, value, timers, bodyClasses,
    tick: () => tick(), ready: () => ready(),
    get removed() { return removed; },
    get cleared() { return cleared; },
  };
}

test('fast first frame uncovers the page immediately without waiting for 100 ticks', () => {
  const app = loader();
  app.ready();
  assert(app.classes.has('done'));
  assert(app.cleared);
  assert.equal(app.value.firstChild.nodeValue, '100');
  assert.equal(app.attributes['aria-valuenow'], '100');
  assert(app.bodyClasses.has('custom-cursor-ready'));
  assert.equal(app.timers.length, 1);
  assert(app.timers[0].delay <= 120);
  app.timers[0].callback();
  assert(app.removed);
});

test('slow startup stays covered until Flutter is ready, then uncovers immediately', () => {
  const app = loader();
  for (let i = 0; i < 200; i++) app.tick();
  assert.equal(app.value.firstChild.nodeValue, '95');
  assert(!app.classes.has('done'));
  assert.equal(app.timers.length, 0);
  app.ready();
  assert(app.classes.has('done'));
  assert.equal(app.value.firstChild.nodeValue, '100');
});
