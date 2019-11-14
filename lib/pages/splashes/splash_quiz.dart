import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olingame/pages/quiz/main_quiz.dart';

class SplashQuiz extends StatefulWidget {
  @override
  _splashQuizState createState() => _splashQuizState();
}

class _splashQuizState extends State<SplashQuiz> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MainQuiz(),
      ));
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "Quiz Olinda",
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}


