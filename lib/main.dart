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
      builder: (context, state) => const Homepage(section: 'home'),
    ),
    GoRoute(
      path: '/home',
      redirect: (context, state) => '/',
    ),
    GoRoute(
      path: '/formalities',
      name: 'formalities',
      builder: (context, state) => const Homepage(section: 'formalities'),
    ),
    GoRoute(
      path: '/project',
      name: 'project',
      builder: (context, state) => const Homepage(section: 'project'),
    ),
  ],
  errorBuilder: (context, state) => const Homepage(section: 'home'),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
