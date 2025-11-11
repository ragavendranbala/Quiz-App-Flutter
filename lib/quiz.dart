import 'package:flutter/material.dart';
import 'package:quiz_app/home.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  int activeScreenIndex = 0;

  void changeScreen() {
    setState(() {
      activeScreenIndex = 1;
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreenIndex = 2;
      });
    }
  }

  void onClickRestartQuiz() {
    print('ravgfa');
    setState(() {
      selectedAnswers = [];
      activeScreenIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = Home(changeScreen);

    switch (activeScreenIndex) {
      case 1:
        currentScreen = QuestionScreen(onAnswerSelected: chooseAnswer);
      case 2:
        currentScreen = ResultsScreen(
          selectedAnswers,
          restartQuiz: onClickRestartQuiz,
        );
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
