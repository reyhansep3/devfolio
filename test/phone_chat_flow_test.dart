import 'dart:ui' show PointerDeviceKind;

import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('lock screen stops scheduling frames after the swipe cue', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: PhoneWidget(width: 300, height: 588)),
      ),
    );
    for (var i = 0; i < 50; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
    expect(tester.binding.hasScheduledFrame, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('lock screen follows the swipe before release', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: PhoneWidget(width: 300, height: 588)),
        ),
      ),
    );
    final swipeHint = find.text('Swipe up to unlock');
    final startY = tester.getTopLeft(swipeHint).dy;
    final gesture = await tester.startGesture(
      tester.getCenter(swipeHint),
      kind: PointerDeviceKind.mouse,
    );
    await gesture.moveBy(const Offset(0, -30));
    await gesture.moveBy(const Offset(0, -90));
    await tester.pump();

    expect(tester.getTopLeft(swipeHint).dy, lessThan(startY - 50));
    expect(find.text('Hello 👋'), findsOneWidget);

    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(swipeHint, findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('short swipe settles back to the lock screen', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: PhoneWidget(width: 300, height: 588)),
        ),
      ),
    );
    final swipeHint = find.text('Swipe up to unlock');
    final startY = tester.getTopLeft(swipeHint).dy;
    final gesture = await tester.startGesture(tester.getCenter(swipeHint));
    await gesture.moveBy(const Offset(0, -20));
    await gesture.moveBy(const Offset(0, -20));
    await tester.pump(const Duration(milliseconds: 200));
    await gesture.up();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    expect(tester.getTopLeft(swipeHint).dy, closeTo(startY, 1));
    expect(find.text('Hello 👋'), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('swipe unlocks phone and preview messages are clearly unsent', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: PhoneWidget(width: 300, height: 588)),
        ),
      ),
    );
    expect(find.text('Swipe up to unlock'), findsOneWidget);
    expect(find.text('Start connecting with me via live chat'), findsOneWidget);

    await tester.drag(find.text('Swipe up to unlock'), const Offset(0, -110));
    await tester.pump(const Duration(milliseconds: 160));
    expect(find.text('Swipe up to unlock'), findsOneWidget);
    expect(find.text('Hello 👋'), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 430));
    expect(find.text('Swipe up to unlock'), findsNothing);

    expect(find.text('Hello 👋'), findsOneWidget);
    expect(find.text('What are you thinking of?'), findsOneWidget);
    expect(find.text('Can we connect?'), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);
    final suggestionStrip = find.byKey(
      const ValueKey('preview-suggestions-strip'),
    );
    expect(suggestionStrip, findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is ListView && widget.scrollDirection == Axis.horizontal,
      ),
      findsNothing,
    );

    final suggestion = find.text('Can we connect?');
    final startX = tester.getTopLeft(suggestion).dx;
    final drag = await tester.startGesture(
      tester.getCenter(suggestion),
      kind: PointerDeviceKind.mouse,
    );
    await drag.moveBy(const Offset(-20, 0));
    await drag.moveBy(const Offset(-55, 0));
    await tester.pump();
    expect(tester.getTopLeft(suggestion).dx, lessThan(startX - 10));
    await drag.moveBy(const Offset(55, 0));
    await tester.pump();
    expect(tester.getTopLeft(suggestion).dx, closeTo(startX, 1));
    await drag.up();

    await tester.enterText(find.byType(TextFormField), 'Hi Reyhan');
    await tester.tap(find.byTooltip('Send message'));
    await tester.pump();
    expect(find.text('Hi Reyhan'), findsOneWidget);
    expect(find.text('Preview only · not sent'), findsOneWidget);
    expect(find.text('Can we connect?'), findsNothing);
    expect(suggestionStrip, findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('fullscreen opens on the chat screen after unlock', (
    tester,
  ) async {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    addTearDown(() => GoRouter.optionURLReflectsImperativeAPIs = false);
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const Scaffold(
            body: Center(child: PhoneWidget(width: 300, height: 588)),
          ),
        ),
        GoRoute(
          path: '/phone-preview',
          builder: (context, state) =>
              PhonePreviewPage(initiallyUnlocked: state.extra == true),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.drag(find.text('Swipe up to unlock'), const Offset(0, -110));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.tap(find.byTooltip('Open phone fullscreen'));
    await tester.pump(const Duration(milliseconds: 600));

    expect(router.routeInformationProvider.value.uri.path, '/phone-preview');
    expect(find.text('Hello 👋'), findsOneWidget);
    expect(find.text('Swipe up to unlock'), findsNothing);
    expect(tester.takeException(), isNull);
  });
}
