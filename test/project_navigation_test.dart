import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_portofolio/view/pages/projects/project_data.dart';
import 'package:flutter_portofolio/view/pages/projects/project_detail_page.dart';
import 'package:flutter_portofolio/view/pages/projects/project_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  for (final size in [const Size(390, 844), const Size(1440, 900)]) {
    testWidgets('project cards remain visible after leaving detail at $size', (
      tester,
    ) async {
      GoogleFonts.config.allowRuntimeFetching = false;
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final router = GoRouter(
        initialLocation: '/project',
        routes: [
          GoRoute(
            path: '/project',
            builder: (context, state) => const Scaffold(
              body: SingleChildScrollView(child: ProjectList()),
            ),
            routes: [
              GoRoute(
                path: ':slug',
                builder: (context, state) => ProjectDetailPage(
                  project: ProjectCatalog.bySlug(state.pathParameters['slug'])!,
                ),
              ),
            ],
          ),
        ],
      );
      addTearDown(router.dispose);

      await tester.pumpWidget(MaterialApp.router(routerConfig: router));
      await tester.ensureVisible(find.text('DIDO'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('DIDO'));
      await tester.pumpAndSettle();
      expect(find.text('What is DIDO?'), findsOneWidget);

      await tester.tap(find.byTooltip('Back to projects'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('Werkspace'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Werkspace'));
      await tester.pumpAndSettle();
      expect(find.text('What is Werkspace?'), findsOneWidget);
      expect(find.text('View on Google Play'), findsOneWidget);
      expect(find.text('View on App Store'), findsOneWidget);

      await tester.tap(find.byTooltip('Back to projects'));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('BanKu'));
      await tester.pumpAndSettle();
      expect(find.text('BanKu').hitTestable(), findsOneWidget);
    });
  }
}
