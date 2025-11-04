import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;

  const OptionTile({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quiz, _) {
        bool isSelected = quiz.userAnswers[quiz.currentQuestion] == index;

        return GestureDetector(
          onTap: () => quiz.selectAnswer(index),
          child: Container(
            width: double.infinity,
            height: 62,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              border: Border.all(
                color: isSelected ? lime : Colors.white.withOpacity(0.2),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontFamily: 'Rubik',
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
