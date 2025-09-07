import 'package:flutter/material.dart'; //to import a package you must specify package:<thenItsName>
import 'package:first_app/_first_app/gradient_container.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp() is the core widget that is provided by the flutter
    return const MaterialApp(
      // Scafflod provide us a very basic, good looking UI
      home: Scaffold(body: GradientContainer()),
    );
  }
}

// Note:- main fn is the fn that dart looks for, when we run it
void main() {
  runApp(
    const MyApp(),
  ); //here this runApp fn is provided by the flutter package, and to use it use need to import the package.
  // Note:- runApp() must used inside a fn body.
}
