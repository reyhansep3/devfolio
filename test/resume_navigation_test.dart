import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/layouts/mobile/mobile_page.dart';
import 'package:flutter_portofolio/view/navigation_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  for (final width in [800.0, 1024.0, 1440.0]) {
    testWidgets('resume actions fit the $width px navbar', (tester) async {
      tester.view.physicalSize = Size(width, 900);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (_, __) => const Scaffold(body: Navbar()),
          ),
        ],
      );
      addTearDown(router.dispose);
      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.pump();

      expect(find.text('FULL CV'), findsNothing);
      expect(find.text('RESUME'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  for (final width in [390.0, 600.0]) {
    testWidgets('resume actions fit the $width px mobile header', (
      tester,
    ) async {
      tester.view.physicalSize = Size(width, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        const MaterialApp(home: MobilePage(section: 'project')),
      );
      expect(find.text('FULL CV'), findsNothing);
      expect(find.text('RESUME'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
