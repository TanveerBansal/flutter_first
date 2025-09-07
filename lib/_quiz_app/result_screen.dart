import 'package:first_app/_quiz_app/data/questions.dart';
import 'package:first_app/_quiz_app/question_summary.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.choosenAnswer,
    required this.handleRestart,
  });
  final List<String> choosenAnswer;
  final void Function() handleRestart;

  //here i use key as String but values as Object, because value will be of type number or string. Since all value in dart is object so this aloow to store any value
  List<Map<String, Object>> getSummaryData() {
    final summary = <Map<String, Object>>[];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                handleRestart();
              },
              child: const Text('Restart Box'),
            ),
          ],
        ),
      ),
    );
  }
}
