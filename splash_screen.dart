import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';
import '../theme.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Q",
                style: TextStyle(fontFamily: 'Galada', fontSize: 90, color: gold),
              ),
              TextSpan(
                text: "uizy",
                style: TextStyle(fontFamily: 'Rubik', fontSize: 48, color: gold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
