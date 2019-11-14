import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olingame/pages/quiz/quiz_page.dart';

class MainQuiz extends StatefulWidget {
  @override
  _mainQuizState createState() => _mainQuizState();
}

class _mainQuizState extends State<MainQuiz> {
  List<String> images = [
    "assets/images/quizIMG/quiz.jpg"
  ];

  Widget customcard(nameRoute, description, colorParam, imageQuiz) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => getjson(),
            ),
          );
        },
        child: Material(
          color: colorParam,
          elevation: 20.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      height: 400.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(imageQuiz),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    nameRoute,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    description,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "OlinGame - Cultura e Educação",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          customcard(
              "Aprenda brincando com o OlinGame", "Teste seu conhecimento", Colors.blue, images[0]),
          //customcard("Rota 02", "Teste de Aprendizagem", Colors.teal, images[1]),
          //customcard("Rota 03", "Teste de Aprendizagem", Colors.redAccent, images[2]),
        ],
      ),
    );
  }
}
