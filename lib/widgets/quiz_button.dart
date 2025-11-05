// lib/widgets/quiz_button.dart
import 'package:flutter/material.dart';
import '../theme.dart';

class QuizButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Size? size; // opsional
  final Color color;
  final Color textColor;
  final bool outlined;

  const QuizButton({
    required this.text,
    required this.onTap,
    this.size,
    this.color = const Color(0xFFA9BE70), // lime
    this.textColor = Colors.white,
    this.outlined = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final s = size ?? MediaQuery.of(context).size;

    // ukuran adaptif: gunakan persen layar tapi batasi minimal & maksimal
    final btnWidth = (s.width * 0.42).clamp(120.0, 320.0);
    final btnHeight = (s.height * 0.065).clamp(44.0, 72.0);
    final fontSize = (s.width * 0.048).clamp(14.0, 20.0);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth,
        height: btnHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outlined ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(12),
          border: outlined ? Border.all(color: Colors.white70, width: 2) : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
