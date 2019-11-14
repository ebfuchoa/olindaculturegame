import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olingame/pages/rotas/Roteiro1_Page.dart';

class SplashRoteiro1 extends StatefulWidget {
  @override
  _splashRoteiro1State createState() => _splashRoteiro1State();
}

class _splashRoteiro1State extends State<SplashRoteiro1> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Roteiro1Page(),
      ));

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Text(
          "Roteiro 01",
          style: TextStyle(
              fontSize: 50.0,
              color: Colors.white
          ),
        ),
      ),
    );
  }
}


