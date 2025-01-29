import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quiz_app/questions.dart";
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers, required this.restart});
  final List<String> choosenAnswers;
  final void Function() restart;

  List<Map<String, Object>> getsummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].questionText,
        "correct_answer": questions[i].answers[0],
        "user_answer": choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getsummaryData();
    final int totalQuestions = questions.length;
    final int totalAnsweredQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You Answered $totalAnsweredQuestions out of $totalQuestions questions correctly!!!",
              textAlign: TextAlign.center,
              style: GoogleFonts.atma(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            QuestionsSummary(summaryData: getsummaryData()),
            SizedBox(height: 10),
            OutlinedButton.icon(
              label: Text("Retry?",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              icon: Icon(
                Icons.refresh_rounded,
                size: 24,
                color: Colors.white,
              ),
              onPressed: (){restart();},
            )
          ],
        ),
      ),
    );
  }
}
