import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex =
      0; //if we put underscore in front of variable name it become private
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    //const is compile time constant whereas final is runtime constant
    {
      "questionText":
          'what\'s your favourite color?', //Map can be used for holding answer of different questions, it can be used using {} inside list
      "answers": [
        {
          "text": 'Black',
          "score": 10,
        },
        {
          "text": 'Red',
          "score": 5,
        },
        {
          "text": 'Green',
          "score": 3,
        },
        {
          "text": 'White',
          "score": 1,
        }
      ],
    },
    {
      "questionText": 'what\'s your favourite animal',
      "answers": [
        {
          "text": 'Lion',
          "score": 10,
        },
        {
          "text": 'Elephant',
          "score": 5,
        },
        {
          "text": 'Giraffe',
          "score": 3,
        },
        {
          "text": 'Wolf',
          "score": 1,
        }
      ],
    },
    {
      "questionText": 'what\'s your favourite food',
      "answers": [
        {
          "text": "Indian",
          "score": 10,
        },
        {
          "text": 'Chinese',
          "score": 5,
        },
        {
          "text": 'Italian',
          "score": 3,
        },
        {
          "text": 'American',
          "score": 1,
        }
      ],
    }
  ];

  void _answerQues(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Quiz App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQues: _answerQues,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
