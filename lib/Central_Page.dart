import 'package:flutter/material.dart';
import 'package:olingame/drawer_list.dart';
import 'package:olingame/pages/rotas/Roteiro1_Page.dart';
import 'package:olingame/pages/hello_page2.dart';
import 'package:olingame/pages/hello_page3.dart';
import 'package:olingame/pages/rotas/Roteiro2_Page.dart';
import 'package:olingame/pages/rotas/Roteiro3_Page.dart';
import 'package:olingame/pages/splashes/splash_quiz.dart';
import 'package:olingame/pages/splashes/splash_roteiro_1.dart';
import 'package:olingame/utils/utils.dart';
import 'package:olingame/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CentralPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Para todas as telas criadas, geralmente vamos utilizar um Scaffold que permite
    // utilizar os elementos do MaterialDesign como o AppBar
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            title: Text("OlinGame - Cultura e Educação"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: "Rota 01"),
                Tab(text: "Rota 02"),
                Tab(text: "Rota 03"),
                Tab(text: "QUIZ"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Roteiro1Page(),
              //_body(context),
              //_bodyRoteiro_1(context),
              Roteiro2Page(),
              Roteiro3Page(),
              _bodyQuizTeste(context),
            ],
          ),
          drawer: DrawerList()),
    );
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _Text("Sítio Histórico de Olinda"),
          _PageView(),
          _Buttons(),
        ],
      ),
    );
  }

//  _bodyQuiz(context) {
//    return Container(
//      padding: EdgeInsets.only(top: 16),
//      color: Colors.white,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          //_PageQuiz(),
//          MainQuiz()
//        ],
//      ),
//    );
//  }
  _bodyRoteiro_1(context) {
    return SplashRoteiro1();
  }

  _bodyQuizTeste(context) {
    return SplashQuiz();
  }

  Container _PageQuiz() {
    // O container serve para você definir o tamanho, a cor e os espaçamentos.
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[],
      ),
    );
  }

  Container _PageView() {
    // O container serve para você definir o tamanho, a cor e os espaçamentos.
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
       child: Image.asset(
       "assets/images/roteiro1/r1_1_igrejaAmparo.jpg",
      ),
//      child: PageView(
//        children: <Widget>[
//          _img("assets/images/olinda.jpg"),
//          _img("assets/images/olinda.jpg"),
//          _img("assets/images/olinda.jpg"),
//          _img("assets/images/olinda.jpg"),
//          _img("assets/images/olinda.jpg"),
//        ],
//      ),
    );
  }

  _Buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, Roteiro1Page())),
                BlueButton("Page 2",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 3",
                    onPressed: () => _onClickNavigator(context, HelloPage3()))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: () => _onClickToast())
              ],
            ),
          ],
        );
      },
    );
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {
          print("OK!");
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Flutter é muito legal!"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("OK!!!");
                  },
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);

    print(">> $s");
  }

  _Text(titulo) {
    return Text(
      titulo,
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }
}
