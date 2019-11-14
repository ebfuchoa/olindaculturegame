import 'package:flutter/material.dart';
import 'package:olingame/Central_Page.dart';
import 'package:olingame/pages/splashes/Splash_Initial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Criado uma única vez no aplicativo
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashInitial(),
    );
  }
}

