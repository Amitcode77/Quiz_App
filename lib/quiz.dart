import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQues;
  int questionIndex;

  Quiz({
    @required this.questions,
    @required this.answerQues,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[questionIndex]["questionText"],
        ),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answers) {
          return Answer(
              () => answerQues(answers["score"]),
              answers[
                  'text']); //()=> refers to anonymous function(on the fly function i.e. we are passing function because we are not able to pass function with argument by onPressed)
        }).toList()
      ],
    );
  }
}
