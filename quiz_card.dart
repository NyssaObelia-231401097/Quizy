import 'package:flutter/material.dart';
import '../theme.dart';

class QuizCard extends StatelessWidget {
  final String questionText;

  const QuizCard({required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      height: 297,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        questionText,
        style: TextStyle(
          fontFamily: 'Rubik',
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    );
  }
}
