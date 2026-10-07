import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_portofolio/animation/scroll_reveal.dart';

void main() {
  testWidgets('revealed content does not restart while scrolling', (
    tester,
  ) async {
    final scrollController = ScrollController();
    addTearDown(scrollController.dispose);
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            controller: scrollController,
            child: const Column(
              children: [
                SizedBox(height: 700),
                ScrollReveal(
                  child: SizedBox(height: 100, child: Text('Target')),
                ),
                SizedBox(height: 700),
              ],
            ),
          ),
        ),
      ),
    );

    final fade = find
        .ancestor(
          of: find.text('Target'),
          matching: find.byType(FadeTransition),
        )
        .first;
    expect(tester.widget<FadeTransition>(fade).opacity.value, 0);

    scrollController.jumpTo(250);
    await tester.pump();
    expect(scrollController.offset, 250);
    await tester.pump(const Duration(milliseconds: 180));
    final progress = tester.widget<FadeTransition>(fade).opacity.value;
    expect(progress, greaterThan(0));
    expect(progress, lessThan(1));

    scrollController.jumpTo(280);
    await tester.pump();
    expect(
      tester.widget<FadeTransition>(fade).opacity.value,
      greaterThanOrEqualTo(progress),
    );

    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.widget<FadeTransition>(fade).opacity.value, 1);
  });
}
