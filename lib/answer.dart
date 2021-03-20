import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
final Function answerPointer;
final String answers; //Funtion is a class used to take function pointer
Answer(this.answerPointer,this.answers);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answers),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: answerPointer,
      ),
    );
  }
}
