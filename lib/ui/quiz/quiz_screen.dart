import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

import 'models/quiz.dart';

class QuizScreen extends StatefulWidget {
  final List<Results> results;

  const QuizScreen({Key key, this.results}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionNumber = 0;

  List<Icon> scoreCard = [];

  void nextQuestion() {
    if (_questionNumber < widget.results.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return widget.results[_questionNumber].question;
  }

  String getCorrectAnswer() {
    return widget.results[_questionNumber].correctAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= widget.results.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = getCorrectAnswer();

    setState(() {
      if (isFinished() == true) {
        print('Quiz Completed');
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Quiz is completed go back to home screen!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .popUntil(ModalRoute.withName('/quiz-landing'));
                  },
                  child: const Text(
                    'Quit',
                  ),
                ),
              ],
            );
          },
        );
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreCard.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreCard.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        nextQuestion();
      }
    });
  }

  List<Widget> answerButtons() {
    return widget.results[_questionNumber].allAnswers
        .map(
          (answer) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 50.0,
            ),
            child: RaisedButton(
              color: Color(0xff008ee7),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              padding: EdgeInsets.all(15.0),
              onPressed: () {
                checkAnswer(answer);
              },
              child: Text(
                HtmlUnescape().convert(answer),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Are you sure you want to exit test?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'Quit',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Close'),
            ),
          ],
        ),
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                      text: '${_questionNumber + 1}',
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.black87,
                      ),
                      children: [
                        TextSpan(
                          text: ' /',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30.0,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.results.length}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      10.0,
                      10.0,
                      10.0,
                      20.0,
                    ),
                    child: Text(
                      HtmlUnescape()
                          .convert(widget.results[_questionNumber].question),
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: answerButtons(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: scoreCard,
            ),
          ],
        ),
      ),
    );
  }
}
