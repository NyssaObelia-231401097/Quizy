import 'package:flutter/material.dart';
import '../models/questions.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> questionsList = questions;

  int currentQuestion = 0;

  String userName = "";
  String userEmail = "";

  List<int> questionTimers = [];

  List<int?> userAnswers = [];

  int get correctCount {
    int correct = 0;
    for (int i = 0; i < questionsList.length; i++) {
      if (userAnswers[i] == questionsList[i].correctAnswer) {
        correct++;
      }
    }
    return correct;
  }

  int get score {
    return ((correctCount / questionsList.length) * 100).toInt();
  }

  void initTimers() {
    questionTimers = List.generate(questionsList.length, (_) => 60);
  }

  void initAnswers() {
    userAnswers = List.generate(questionsList.length, (_) => null);
  }

  void setUser(String name, String email) {
    userName = name;
    userEmail = email;
  }

  void selectAnswer(int index) {
    userAnswers[currentQuestion] = index;
    notifyListeners();
  }

  void nextQuestion() {
    if (currentQuestion < questionsList.length - 1) {
      currentQuestion++;
      notifyListeners();
    }
  }

  void previousQuestion() {
    if (currentQuestion > 0) {
      currentQuestion--;
      notifyListeners();
    }
  }

  void resetQuiz() {
    currentQuestion = 0;
    initTimers();
    initAnswers();
    notifyListeners();
  }

  void submitAnswers() {}
}
