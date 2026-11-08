import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/pages/home/widgets/phone_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  for (final size in [
    const Size(1200, 800),
    const Size(768, 1024),
    const Size(390, 844),
  ]) {
    testWidgets('phone preview fits ${size.width} x ${size.height}', (
      tester,
    ) async {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      GoRouter.optionURLReflectsImperativeAPIs = true;
      addTearDown(() => GoRouter.optionURLReflectsImperativeAPIs = false);

      final router = GoRouter(
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (_, __) => const NoTransitionPage(
              child: Scaffold(
                body: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 24),
                    child: Hero(
                      tag: phonePreviewHeroTag,
                      child: PhoneWidget(width: 280, height: 549),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GoRoute(
            path: '/phone-preview',
            pageBuilder: (_, state) => CustomTransitionPage<void>(
              key: state.pageKey,
              child: const PhonePreviewPage(),
              transitionDuration: const Duration(milliseconds: 550),
              reverseTransitionDuration: const Duration(milliseconds: 550),
              transitionsBuilder: (_, animation, __, child) =>
                  FadeTransition(opacity: animation, child: child),
            ),
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));

      final startCenter = tester.getCenter(find.byType(PhoneWidget));
      await tester.tap(find.byTooltip('Open phone fullscreen'));
      await tester.pump();
      if (size.width == 1200) {
        await tester.pump(const Duration(milliseconds: 275));
        final movingCenter = tester.getCenter(find.byType(PhoneWidget));
        expect(movingCenter.dx, greaterThan(size.width / 2));
        expect(movingCenter.dx, lessThan(startCenter.dx));
      }
      await tester.pump(const Duration(milliseconds: 600));
      expect(router.routeInformationProvider.value.uri.path, '/phone-preview');
      expect(
        router.routeInformationParser
            .restoreRouteInformation(router.routerDelegate.currentConfiguration)
            ?.uri
            .path,
        '/phone-preview',
      );

      final phones = tester
          .widgetList<PhoneWidget>(find.byType(PhoneWidget))
          .toList();
      expect(phones, hasLength(1));
      final preview = phones.single;
      expect(preview.expanded, isTrue);
      expect(preview.width, lessThanOrEqualTo(size.width));
      expect(preview.height, lessThanOrEqualTo(size.height));
      if (size.width < 600) {
        expect(preview.fullscreen, isTrue);
        expect(preview.width, size.width);
        expect(preview.height, size.height);
      } else {
        expect(preview.fullscreen, isFalse);
      }

      router.pop(); // Browser Back follows the same router pop path.
      await tester.pump();
      if (size.width == 1200) {
        await tester.pump(const Duration(milliseconds: 275));
        final returningCenter = tester.getCenter(find.byType(PhoneWidget));
        expect(returningCenter.dx, greaterThan(size.width / 2));
        expect(returningCenter.dx, lessThan(startCenter.dx));
      }
      await tester.pump(const Duration(milliseconds: 600));
      expect(find.byType(PhoneWidget), findsOneWidget);
      if (size.width == 1200) {
        expect(tester.getCenter(find.byType(PhoneWidget)), startCenter);
      }

      await tester.tap(find.byTooltip('Open phone fullscreen'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));
      await tester.tap(find.byTooltip('Back to normal size'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 600));
      expect(find.byType(PhoneWidget), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
