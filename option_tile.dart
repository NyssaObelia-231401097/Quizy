// lib/widgets/option_tile.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme.dart';

class OptionTile extends StatelessWidget {
  final String text;
  final int index;
  final Size? size; // opsional

  const OptionTile({required this.text, required this.index, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    final s = size ?? MediaQuery.of(context).size;

    return Consumer<QuizProvider>(
      builder: (context, quiz, _) {
        final bool isSelected = quiz.userAnswers.isNotEmpty && quiz.userAnswers[quiz.currentQuestion] == index;

        return GestureDetector(
          onTap: () => quiz.selectAnswer(index),
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: s.height * 0.015),
            padding: EdgeInsets.symmetric(vertical: s.height * 0.018, horizontal: s.width * 0.04),
            decoration: BoxDecoration(
              color: isSelected ? lime.withOpacity(0.95) : Colors.white.withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? correctBorderColor() : Colors.white.withOpacity(0.22),
                width: 2,
              ),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white,
                fontSize: s.width * 0.048,
                fontFamily: 'Rubik',
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      },
    );
  }

  // helper: warna border saat terpilih (bisa diubah)
  Color correctBorderColor() => darkGreen;
}
