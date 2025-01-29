import "package:flutter/material.dart";

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerQuestion, this.text, {super.key});

  final void Function() answerQuestion;
  final String text;

  @override
  Widget build(context) {
    return FilledButton(
      onPressed: answerQuestion,
      style: FilledButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: const Color.fromARGB(255, 106, 0, 124),
        foregroundColor: Colors.white70,
        textStyle: TextStyle(fontSize: 18,),
      ),
      child: Text(
        text,
        style: TextStyle(),
      ),
    );
  }
}
