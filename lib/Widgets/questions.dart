import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({
    super.key,
    required this.questionsList,
  });

  final MyQuestions questionsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width - 30,
            padding: EdgeInsets.all(10),
            color: Colors.black12,
            child: Text(
              textAlign: TextAlign.center,
              questionsList.questionsText,
              style: TextStyle(
                color: questionsList.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyQuestions {
  MyQuestions(
    this.questionsText,
    this.isTrue,
    this.color,
    this.textColor,
  );
  String questionsText;
  bool isTrue;
  Color color;
  Color textColor;
  bool? theAwnser = null;
}

List<MyQuestions> myQuestionsList = [
  MyQuestions("اللون اصفر", true, Colors.yellow, Colors.red),
  MyQuestions("اللون اخضر", true, Colors.green, Colors.blue),
  MyQuestions("اللون احمر", true, Colors.red, Colors.green),
  MyQuestions("اللون رمادي", true, Colors.grey, Colors.indigo),
  MyQuestions("اللون ابيض", true, Colors.white, Colors.black),
  MyQuestions("اللون  ليس رمادي", false, Colors.grey, Colors.deepPurple),
  MyQuestions("اللون وردي", true, Colors.pink, Colors.yellow),
  MyQuestions("اللون ليس بنفسجي", false, Colors.purple, Colors.lightBlueAccent),
  MyQuestions("اللون ليس ابيض", false, Colors.white, Colors.teal),
];
