import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olingame/pages/quiz/result_page.dart';

class getjson extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("assets/olindaQuiz.json"),
      builder: (context, snapshot) {
        var myData = json.decode(snapshot.data.toString());
        if (myData == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading...",
              ),
            ),
          );
        } else {
          return QuizPage(myData: myData);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {

  var myData;

  QuizPage({Key key, @required this.myData}): super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState(myData);
}

class _QuizPageState extends State<QuizPage> {

  var myData;
  _QuizPageState(this.myData);

  Color colorToShow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  int timer = 30;
  String showTimer = "30";

  Map<String, Color> btnColor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent
  };

  bool cancelTimer = false;

  @override
  void initState(){
    startTimer();
    super.initState();
  }

  void startTimer() async{
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t){
      if (this.mounted){
        setState(() {
          if(timer < 1) {
            t.cancel();
            nextQuestion();
          }else if(cancelTimer == true){
            t.cancel();
          }else{
            timer = timer - 1;
          }
          showTimer = timer.toString();
        });
      }
    });
  }

  void nextQuestion(){
    cancelTimer = false;
    timer = 30;
    if (this.mounted) {
      setState(() {
        if (i < 5) {
          i++;
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => ResultPage(marks: marks),
          ));
        }
        btnColor["a"] = Colors.indigoAccent;
        btnColor["b"] = Colors.indigoAccent;
        btnColor["c"] = Colors.indigoAccent;
        btnColor["d"] = Colors.indigoAccent;
      }
      );
    }
    startTimer();
  }

  void checkAnswer(String option) {
    if(myData[2][i.toString()] == myData[1][i.toString()][option]){
      marks = marks + 3; //Soma a pontuação dos acertos
      colorToShow = right;
    }else {
      colorToShow = wrong;
    }
    setState(() {
      btnColor[option] = colorToShow;
      cancelTimer = true;
    });

    Timer(Duration(seconds: 2), nextQuestion);
  }

  Widget choiceButton(String option) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: MaterialButton(
        onPressed: () => checkAnswer(option),
        child: Text(
          myData[1][i.toString()][option],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: "Alike",
          ),
          maxLines: 1,
        ),
        color: btnColor[option],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200,
        height: 45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return WillPopScope(
      onWillPop: (){
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Quizzz"
            ),
            content: Text(
              "Você não pode voltar desse estágio!"
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                ),
              )
            ],
          )
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Text(
                  myData[0][i.toString()],
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choiceButton('a'),
                      choiceButton('b'),
                      choiceButton('c'),
                      choiceButton('d'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,

                child: Center(
                  child: Text(
                    showTimer,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Times New Roman"
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
