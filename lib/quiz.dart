import "package:flutter/material.dart";
import "package:quiz_app/questions.dart";
import "package:quiz_app/results_screen.dart";
import "package:quiz_app/start_screen.dart";
import "package:quiz_app/question_screen.dart";

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  Widget? activeScreen;
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          choosenAnswers: selectedAnswers, restart: restartQuiz,
        );
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        chooseAnswer: chooseAnswer,
      );
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
