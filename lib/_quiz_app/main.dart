import 'package:flutter/material.dart';
import 'package:first_app/_quiz_app/quiz.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const Quiz();
  }
}

void main() {
  runApp(const MyApp(key: Key('MyAppInMain')));
}
