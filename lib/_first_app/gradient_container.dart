import 'package:flutter/material.dart';
// import 'package:first_app/styled_text.dart';
import 'package:first_app/_first_app/dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    this.customColors = const [
      Colors.deepPurple,
      Colors.indigo,
    ],
    super.key,
  }); //while defining public widget key must be passed to parent's superclass

  final List<Color> customColors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: customColors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      // child: const Center(child: StyledText('This is testing..')),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
