class Question {
  final String text;
  final List<String> options;
  final int correctAnswer;

  Question({
    required this.text,
    required this.options,
    required this.correctAnswer,
  });
}

List<Question> questions = [
  Question(
    text: "12 + 5 = ",
    options: ["15", "17", "12", "10"],
    correctAnswer: 1,
  ),
  Question(
    text: "7 x 6 = ",
    options: ["42", "36", "40", "45"],
    correctAnswer: 0,
  ),
  Question(
    text: "20 ÷ 4 = ",
    options: ["6", "4", "5", "8"],
    correctAnswer: 2,
  ),
  Question(
    text: "15 - 7 = ",
    options: ["8", "9", "7", "10"],
    correctAnswer: 0,
  ),
  Question(
    text: "9 + 8 = ",
    options: ["17", "16", "18", "19"],
    correctAnswer: 0,
  ),
];
//
