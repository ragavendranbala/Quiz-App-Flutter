import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary_screen.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.selectedAnswers, {
    super.key,
    required this.restartQuiz,
  });
  final List<String> selectedAnswers;
  final Function restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumberOfQuestions = questions.length;
    final totalNumberOfCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return Center(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You have answered $totalNumberOfCorrectAnswers out of $totalNumberOfQuestions questions correctly',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            QuestionSummaryScreen(summaryData),
            SizedBox(height: 30),
            ElevatedButton.icon(
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: Color(0xFF00E5FF),
              //   foregroundColor: Color(0xFF000000),
              // ),
              icon: Icon(Icons.refresh),
              onPressed: () => restartQuiz(),
              label: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
