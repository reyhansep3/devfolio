import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/home_intro_sections.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final width in [320.0, 375.0, 414.0, 768.0, 1440.0]) {
    testWidgets('About section fits ${width.toInt()}px', (tester) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: Builder(builder: (context) =>
              homeAbout(context, width, 900)),
          ),
        ),
      ));
      await tester.pump(const Duration(milliseconds: 600));

      expect(find.byType(PhoneWidget), findsOneWidget);
      expect(find.text('Who I am'), findsOneWidget);
      expect(find.text('Messy problems in. Working software out.'), findsOneWidget);
      expect(tester.getSize(find.byType(OutlinedButton)).height,
        greaterThanOrEqualTo(44));
      expect(tester.takeException(), isNull);
    });
  }
}
