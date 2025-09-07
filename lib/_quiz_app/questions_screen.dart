import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:first_app/_quiz_app/answer_button.dart';
import 'package:first_app/_quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // currentQuestionIndex = currentQuestionIndex + 1;
    // currentQuestionIndex += 1;
    setState(() {
      currentQuestionIndex++; // increments the value by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, //this will cover the entire width available
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffleAnswers().map(
              (answer) => AnswerButton(
                answer,
                onTap: () {
                  answerQuestion(answer);
                },
              ),
            ),
            // ...List.generate(
            //   4,
            //   (index) =>
            //       AnswerButton(currentQuestion.answers[index], onTap: () {}),
            // ),
            // Expanded(
            //   // <-- gives ListView height constraint
            //   child: ListView.builder(
            //     itemCount: 4,
            //     itemBuilder: (context, index) {
            //       return const AnswerButton(); // no need to wrap in ListTile unless needed
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
