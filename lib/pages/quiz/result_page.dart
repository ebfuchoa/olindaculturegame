import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olingame/Central_Page.dart';

class ResultPage extends StatefulWidget {

  int marks;

  ResultPage({Key key, @required this.marks}): super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {

  List<String> images = [
    "assets/images/quizIMG/success.jpg",
    "assets/images/quizIMG/good.jpg",
    "assets/images/quizIMG/bad.jpg",
    "assets/images/quizIMG/congratulation.jpg"
  ];

  String message;
  String image;

  @override
  void initState(){
    if(marks <= 6){
      image = images[2];
      message = "Você precisa estudar muito e tentar novamente.\n"+"Você obteve apenas $marks pontos.";
    }else if(marks <= 9){
      image = images[1];
      message = "Você pode fazer melhor.\n"+"Você conseguiu $marks pontos.";
    }else if(marks <= 12){
      image = images[0];
      message = "Parabéns!!! Você foi muito bem.\n"+"Você conseguiu $marks pontos.";
    }else{
      image = images[3];
      message = "Parabéns!!! Você é incrível.\n"+"Você conseguiu $marks pontos.";
    }
    super.initState();
  }


  int marks;
  _ResultPageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultado",
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300,
                        height: 300,
                        child: ClipRect(
                          child: Image(
                            image: AssetImage(
                              image,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Times New Roman"
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CentralPage(),
                    ));
                  },
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  borderSide: BorderSide(width: 5, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
