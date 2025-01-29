import "package:flutter/material.dart";
import "package:quiz_app/questions.dart";
import "package:quiz_app/answer_button.dart";
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.chooseAnswer});

  final void Function(String answer) chooseAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.questionText,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          ...currentQuestion.getShuffledAnswers().map((item) {
            return AnswerButton((){
              answerQuestion(item);
            },item);
          }),
        ],
      ),
    );
  }
}
