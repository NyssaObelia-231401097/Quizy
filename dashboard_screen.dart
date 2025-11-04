import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme.dart';
import 'quiz_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "/dashboard";

  // Daftar kuisnya
  final List<Map<String, dynamic>> quizList = [
    {"title": "Math Quiz", "clickable": true, "totalQuestions": 5},
    {"title": "Science Quiz", "clickable": false, "totalQuestions": 10},
    {"title": "History Quiz", "clickable": false, "totalQuestions": 8},
    {"title": "Geography Quiz", "clickable": false, "totalQuestions": 12},
    {"title": "English Quiz", "clickable": false, "totalQuestions": 7},
  ];

  // Greeting ke user (menyesuaikan)
  String getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return "Good Morning";
    if (hour >= 12 && hour < 17) return "Good Afternoon";
    if (hour >= 17 && hour < 20) return "Good Evening";
    return "Good Night";
  }

  @override
  Widget build(BuildContext context) {
    final quiz = Provider.of<QuizProvider>(context);
    final greeting = getGreeting();
    final userName = quiz.userName;

    return Scaffold(
      backgroundColor: darkGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, LoginScreen.routeName);
                    },
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "$greeting, $userName",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Container putih untuk all quizs
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Quizs",
                        style: TextStyle(
                          color: darkGreen,
                          fontSize: 24,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 12),

                      // List quis
                      Expanded(
                        child: ListView.builder(
                          itemCount: quizList.length,
                          itemBuilder: (context, index) {
                            final item = quizList[index];
                            return QuizBar(
                              title: item["title"],
                              clickable: item["clickable"],
                              totalQuestions: item["totalQuestions"],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quiz bar
class QuizBar extends StatelessWidget {
  final String title;
  final bool clickable;
  final int totalQuestions;

  const QuizBar({
    required this.title,
    required this.clickable,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickable
          ? () {
        final quiz = Provider.of<QuizProvider>(context, listen: false);

        quiz.resetQuiz();
        quiz.initTimers();
        quiz.initAnswers();

        Navigator.pushNamed(context, QuizScreen.routeName);
      }
          : null,

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: darkGreen, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // Title quiz & keterangan jumlah soal
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: darkGreen,
                      fontFamily: 'Rubik',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$totalQuestions Questions",
                    style: TextStyle(
                      color: darkGreen,
                      fontFamily: 'Rubik',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            clickable
                ? Icon(Icons.arrow_forward, color: darkGreen)
                : Icon(Icons.lock, color: Colors.grey[700]),
          ],
        ),
      ),
    );
  }
}
