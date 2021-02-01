import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/quiz.dart';

import 'package:http/http.dart' as http;

import 'quiz_screen.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  Quiz quiz;
  List<Results> results;

  Future<void> fetchQuestions() async {
    const String url = 'https://opentdb.com/api.php?amount=10&category=18';
    final res = await http.get(url);
    final decRes = jsonDecode(res.body);
    quiz = Quiz.fromJson(decRes as Map<String, dynamic>);
    results = quiz.results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchQuestions(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press Button to Start');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case ConnectionState.done:
            return Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/examination.png',
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: Text(
                        'Start Quiz',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(results: results),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.play_arrow,
                  ),
                  label: const Text('Start'),
                ));
        }
      },
    );
  }
}
