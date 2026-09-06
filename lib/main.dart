import 'package:flutter/material.dart';
import 'package:flutter_portofolio/item/app_colors.dart';
import 'package:flutter_portofolio/view/pages/home/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    final path = state.uri.path;
    if (path != '/' && path.endsWith('/')) {
      return path.substring(0, path.length - 1);
    }
    return null;
  },
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'home'),
      ),
    ),
    GoRoute(
      path: '/home',
      redirect: (context, state) => '/',
    ),
    GoRoute(
      path: '/formalities',
      name: 'formalities',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'formalities'),
      ),
    ),  
    GoRoute(
      path: '/project',
      name: 'project',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'project'),
      ),
    ),
    GoRoute(
      path: '/blog',
      name: 'blog',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: Homepage(section: 'blog'),
      ),
    ),
  ],
  errorBuilder: (context, state) => const Homepage(section: 'home'),
);

void main() {
  runApp(const MyApp());
}

const double kDesignViewportHeight = 900.0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    // Floor: jangan biarkan tinggi turun di bawah baseline saat di-resize vertikal.
    final lockedHeight = mq.size.height < kDesignViewportHeight
        ? kDesignViewportHeight
        : mq.size.height;
    return MediaQuery(
      data: mq.copyWith(size: Size(mq.size.width, lockedHeight)),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter',
        theme: ThemeData(
          primaryColor: AppColor.primary,
        ),
        routerConfig: _router,
      ),
    );
  }
}