import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Row(
              children: [
                Container(
                  width: 35,
                  height: 55,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 225, 57, 255),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(142, 208, 0, 255),
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer,
                       spreadRadius: 0.0 )
                      ]),
                  child: Text(
                    ((item['question_index'] as int) + 1).toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((item['question'].toString()),
                          style: TextStyle(fontSize: 16, color: Colors.black)),
                      Text(
                        item['correct_answer'].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 255, 68)),
                      ),
                      Text(
                        item['user_answer'].toString(),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 245, 250, 195)),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
