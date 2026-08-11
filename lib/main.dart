import 'package:flutter/material.dart';
import 'package:flutter_portofolio/view/home_page.dart';
import 'package:flutter_portofolio/view/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        final section = routeToSection(settings.name);
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Homepage(initialSection: section),
        );
      },
    );
  }
}
