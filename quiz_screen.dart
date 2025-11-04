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

  int get currentTimer =>
      quizProvider.questionTimers[quizProvider.currentQuestion];

  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;

      int q = quizProvider.currentQuestion;

      if (quizProvider.questionTimers[q] > 0) {
        quizProvider.questionTimers[q]--;
        setState(() {});
        startTimer();
      } else {
        if (q < quizProvider.questionsList.length - 1) {
          quizProvider.nextQuestion();
          startTimer();
        } else {
          Navigator.pushReplacementNamed(context, SubmitScreen.routeName);
        }
      }
    });
  }

  Future<bool> _onWillPop() async {
    if (quizProvider.currentQuestion == 0) {
      return await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: darkGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Color(0xFFE5D582), width: 2),
          ),
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: 300,
            height: 220,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Are you sure you want to exit?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "Your progress will be lost",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Container(
                        width: 99,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFF34C759),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        quizProvider.resetQuiz();
                        Navigator.pop(context, true);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 99,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF383C),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );
    } else {
      quizProvider.previousQuestion();
      setState(() {});
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: darkGreen,
        body: SafeArea(
          child: Consumer<QuizProvider>(
            builder: (_, quiz, __) => Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 53,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "${quiz.currentQuestion + 1}/${quiz.questionsList.length}",
                          style: TextStyle(
                              color: darkGreen,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      QuizTimer(timer: currentTimer),
                    ],
                  ),

                  SizedBox(height: 16),

                  QuizCard(
                      questionText:
                      quiz.questionsList[quiz.currentQuestion].text),

                  SizedBox(height: 16),

                  Text(
                    "Select the correct option",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Rubik'),
                  ),

                  SizedBox(height: 8),

                  Column(
                    children: List.generate(
                      quiz.questionsList[quiz.currentQuestion].options.length,
                          (i) => OptionTile(
                        text: quiz.questionsList[quiz.currentQuestion].options[i],
                        index: i,
                      ),
                    ),
                  ),

                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QuizButton(
                        text: "Back",
                        onTap: _onWillPop,
                        color: lime,
                        textColor: Colors.white,
                        outlined: true,
                      ),

                      quiz.currentQuestion ==
                          quiz.questionsList.length - 1
                          ? QuizButton(
                        text: "Submit",
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SubmitScreen.routeName);
                        },
                        color: lime,
                      )
                          : QuizButton(
                        text: "Next",
                        onTap: () {
                          quizProvider.nextQuestion();
                          setState(() {});
                        },
                        color: lime,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
