import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olingame/Central_Page.dart';
import 'package:olingame/pages/rotas/Roteiro1_Page_bck.dart';
import 'package:olingame/pages/quiz/main_quiz.dart';

class SplashInitial extends StatefulWidget {
  @override
  _splashInitialState createState() => _splashInitialState();
}

class _splashInitialState extends State<SplashInitial> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => CentralPage(),
      ));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "Colocar a LOGO DO APP",
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}


