import 'dart:math';
import 'package:flutter/material.dart';

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var imageNum = '1';
  void rollDice() {
    setState(
      () {
        imageNum = '${random.nextInt(6)+1}';
      },
    ); //without setState the state will be changed ,but no changes will reflect on UI, as its tell flutter to change the UI state change
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      //Column & row widgets are to add multiple child widgets
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: Image.asset('assets/images/dice-$imageNum.png', width: 200),
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 28),
            padding: const EdgeInsets.only(top: 20),
          ),
          child: const Text('Roll...'),
        ),
      ],
    );
  }
}
