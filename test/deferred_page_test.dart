import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/deferred_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('loads once across rebuilds and displays the requested page', (
    tester,
  ) async {
    final loading = Completer<void>();
    var calls = 0;
    Future<void> load() {
      calls++;
      return loading.future;
    }

    Widget app() => MaterialApp(
      home: DeferredPage(
        loadLibrary: load,
        builder: (_) => const Text('Detail content'),
      ),
    );

    await tester.pumpWidget(app());
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('Detail content'), findsNothing);
    await tester.pumpWidget(app());
    expect(calls, 1);

    loading.complete();
    await tester.pump();
    expect(find.text('Detail content'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('failed chunk can be retried without losing navigation', (
    tester,
  ) async {
    var calls = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: DeferredPage(
          loadLibrary: () async {
            if (++calls == 1) throw StateError('Network unavailable');
          },
          builder: (_) => const Text('Detail content'),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('Unable to load page. Retry'), findsOneWidget);
    await tester.tap(find.text('Unable to load page. Retry'));
    await tester.pump();
    await tester.pump();
    expect(calls, 2);
    expect(find.text('Detail content'), findsOneWidget);
  });
}
