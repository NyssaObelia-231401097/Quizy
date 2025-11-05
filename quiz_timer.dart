import 'package:flutter/material.dart';
import '../theme.dart';

class QuizTimer extends StatelessWidget {
  final int timer;

  const QuizTimer({required this.timer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 33,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        "$timer s",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: darkGreen,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
    );
  }
}
