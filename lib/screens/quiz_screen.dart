// lib/screens/quiz_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/quiz_card.dart';
import '../widgets/option_tile.dart';
import '../widgets/quiz_button.dart';
import '../widgets/quiz_timer.dart';
import '../theme.dart';
import 'submit_screen.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = "/quiz";

  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late QuizProvider quizProvider;

  @override
  void initState() {
    super.initState();
    quizProvider = Provider.of<QuizProvider>(context, listen: false);
    startTimer();
  }

  int get currentTimer => quizProvider.questionTimers[quizProvider.currentQuestion];

  // sederhana loop timer tanpa isolate; memakai mounted check
  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      final q = quizProvider.currentQuestion;
      if (quizProvider.questionTimers.isEmpty) return;
      if (quizProvider.questionTimers[q] > 0) {
        quizProvider.questionTimers[q]--;
        setState(() {});
        startTimer();
      } else {
        if (q < quizProvider.questionsList.length - 1) {
          quizProvider.nextQuestion();
          startTimer();
        } else {
          // submit/selesai
          Navigator.pushReplacementNamed(context, SubmitScreen.routeName);
        }
      }
    });
  }

  // safe back handling: jika sedang soal >0 maka previous, else dialog
  Future<bool> _onWillPop() async {
    final quiz = Provider.of<QuizProvider>(context, listen: false);
    if (quiz.currentQuestion == 0) {
      final res = await showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Color(0xFFE5D582), width: 2),
          ),
          title: const Text('Exit Quiz?', style: TextStyle(color: Colors.white)),
          content: const Text('Your progress will be lost', style: TextStyle(color: Colors.white70)),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel', style: TextStyle(color: Colors.white))),
            TextButton(onPressed: () {
              quiz.resetQuiz();
              Navigator.pop(context, true);
              Navigator.pop(context);
            }, child: const Text('Yes', style: TextStyle(color: Colors.red))),
          ],
        ),
      );
      return res ?? false;
    } else {
      quiz.previousQuestion();
      setState(() {});
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    // ambil ukuran layar
    final size = MediaQuery.of(context).size;
    final quiz = Provider.of<QuizProvider>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: darkGreen,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // top row: nomor soal + timer
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: size.height * 0.009, horizontal: size.width * 0.03),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        "${quiz.currentQuestion + 1}/${quiz.questionsList.length}",
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                    ),
                    QuizTimer(timer: currentTimer, size: size), // size opsional di QuizTimer
                  ],
                ),

                SizedBox(height: size.height * 0.02),

                // question card
                QuizCard(questionText: quiz.questionsList[quiz.currentQuestion].text, size: size),

                SizedBox(height: size.height * 0.02),

                // instruction (pastikan tidak hilang)
                Text(
                  "Select the correct option",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width * 0.052,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: size.height * 0.012),

                // options list (scrollable)
                Expanded(
                  child: ListView.builder(
                    itemCount: quiz.questionsList[quiz.currentQuestion].options.length,
                    itemBuilder: (context, i) {
                      return OptionTile(
                        text: quiz.questionsList[quiz.currentQuestion].options[i],
                        index: i,
                        size: size, // opsional -> responsive
                      );
                    },
                  ),
                ),

                SizedBox(height: size.height * 0.01),

                // buttons row (gunakan QuizButton yang menerima size opsional)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuizButton(
                      text: "Back",
                      onTap: () {
                        if (quiz.currentQuestion > 0) quiz.previousQuestion();
                        setState(() {});
                      },
                      size: size,
                      outlined: true,
                    ),
                    quiz.currentQuestion == quiz.questionsList.length - 1
                        ? QuizButton(
                      text: "Submit",
                      onTap: () => Navigator.pushReplacementNamed(context, SubmitScreen.routeName),
                      size: size,
                    )
                        : QuizButton(
                      text: "Next",
                      onTap: () {
                        quiz.nextQuestion();
                        setState(() {});
                      },
                      size: size,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//