import 'package:flutter/material.dart';
import '../theme.dart';

class QuizButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;
  final bool outlined;

  const QuizButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Colors.lime,
    this.textColor = Colors.white,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 188,
        height: 51,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: outlined ? darkGreen : color,
          borderRadius: BorderRadius.circular(12),
          border: outlined
              ? Border.all(
            color: lime,
            width: 2,
          )
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Rubik',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
