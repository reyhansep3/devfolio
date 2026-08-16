import 'package:flutter/material.dart';
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
  ],
  errorBuilder: (context, state) => const Homepage(section: 'home'),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}