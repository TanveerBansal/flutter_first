import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, {required this.onTap, super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return (ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        // padding: const EdgeInsets.symmetric(horizontal: 100),
        // minimumSize: const Size(200, 40),
        // maximumSize: const Size(300, 40),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 33, 1, 95),
        // shape: 
      ),
      child: Text(answerText, textAlign: TextAlign.center,),
    ));
  }
}
