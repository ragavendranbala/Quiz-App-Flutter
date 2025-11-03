import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  int selectedWidget = 0;

  void changeScreen() {
    setState(() {
      selectedWidget = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = Home(changeScreen);
    if (selectedWidget == 1) {
      currentScreen = QuestionScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
