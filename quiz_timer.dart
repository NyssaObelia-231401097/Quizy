// lib/widgets/quiz_timer.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class QuizTimer extends StatelessWidget {
  final int timer;
  final Size? size; // opsional

  const QuizTimer({required this.timer, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    final s = size ?? MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: s.height * 0.007, horizontal: s.width * 0.03),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "$timer s",
        style: TextStyle(
          color: darkGreen,
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w700,
          fontSize: s.width * 0.044,
        ),
      ),
    );
  }
}
