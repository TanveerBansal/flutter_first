import 'package:flutter/material.dart';
import 'package:first_app/_quiz_app/start_screen.dart';
import 'package:first_app/_quiz_app/questions_screen.dart';
import 'package:first_app/_quiz_app/data/questions.dart';
import 'package:first_app/_quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswer = [];
  var activeScreen = 'start_screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'question_screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        // selectedAnswer = [];
        activeScreen = 'result_screen';
      });
    }
  }

  void handleRestart() {
    selectedAnswer = [];
    setState(() {
      activeScreen = 'start_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question_screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result_screen') {
      screenWidget = ResultScreen(
        choosenAnswer: selectedAnswer,
        handleRestart: handleRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 20, 146),
                Color.fromARGB(255, 100, 40, 204),
              ],
            ),
          ),
          // child: activeScreen,
          child: screenWidget,
        ),
      ),
    );
  }
}
