import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Colors.white.withAlpha(150),
            colorBlendMode: BlendMode.dstIn,
          ),
          const Padding(
            padding: EdgeInsetsGeometry.only(top: 70),
            child: Text(
              'Learn flutter the fun way!',
              style: TextStyle(
                color: Color.fromARGB(246, 244, 242, 242),
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsGeometry.only(top: 40),
            child: OutlinedButton.icon(
              label: const Text('Start Quiz'),
              onPressed: startQuiz,
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(246, 244, 242, 242),
                backgroundColor: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
