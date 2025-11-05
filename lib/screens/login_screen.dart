import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../theme.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Q',
                        style: TextStyle(
                          fontFamily: 'Galada',
                          fontSize: 90,
                          color: gold,
                        ),
                      ),
                      TextSpan(
                        text: 'uizy',
                        style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 48,
                          color: gold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Container putih
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 12,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Log In",
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: darkGreen,
                            ),
                          ),
                        ),
                        SizedBox(height: 25),

                        // Input Nama
                        Text(
                          "Name",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: darkGreen,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 18,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                            hintStyle: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(color: darkGreen, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(color: darkGreen, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(color: darkGreen, width: 3),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama tidak boleh kosong';
                            }
                            return null;
                          },
                          onSaved: (value) => _name = value ?? '',
                        ),
                        SizedBox(height: 20),

                        // Input Email
                        Text(
                          "Email",
                          style: TextStyle(
                            fontFamily: 'Rubik',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: darkGreen,
                          ),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 18,
                              color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                              color: Colors.grey[500],
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(color: darkGreen, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(color: darkGreen, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                              BorderSide(color: darkGreen, width: 3),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            if (!value.contains('@')) {
                              return 'Email tidak valid';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value ?? '',
                        ),
                        SizedBox(height: 30),

                        // Button Log In
                        Center(
                          child: SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkGreen,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadowColor: Colors.black45,
                                elevation: 4,
                              ),
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  fontFamily: 'Rubik',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  Provider.of<QuizProvider>(context,
                                      listen: false)
                                      .setUser(_name, _email);

                                  Navigator.pushReplacementNamed(
                                      context, DashboardScreen.routeName);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
