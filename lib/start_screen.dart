import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;


  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/quiz-logo.png",
            width: 350, color: const Color.fromARGB(255, 236, 169, 255)),
        SizedBox(height: 30),
        Text(
          "Lets Learn Flutter With Fun !!!",
          style: GoogleFonts.novaRound(fontSize: 22, color: Colors.white),
        ),
        SizedBox(height: 20),
        OutlinedButton.icon(
          onPressed: startQuiz,
          label: Text(
            "Start Quiz",
            style: TextStyle(fontSize: 22),
          ),
          icon: Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 22,
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: (){},
          label: Text(
            "Exit",
            style: TextStyle(fontSize: 22),
          ),
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
            size: 22,
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
