// lib/widgets/quiz_card.dart
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String questionText;
  final Size? size; // opsional agar backward-compatible

  const QuizCard({required this.questionText, this.size, super.key});

  @override
  Widget build(BuildContext context) {
    final s = size ?? MediaQuery.of(context).size;
    // lebar penuh dengan padding, tinggi auto sesuai isi tapi dibatasi minHeight
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: s.height * 0.03, horizontal: s.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.09),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Text(
        questionText,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Rubik',
          color: Colors.white,
          fontSize: s.width * 0.055,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
