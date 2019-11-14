import 'package:flutter/material.dart';
import 'package:olingame/model/lugar.dart';

class LugarPage extends StatelessWidget {

  final Lugar lugar;

  LugarPage(this.lugar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lugar.nome),
      ),
      body: Image.asset(lugar.foto),
    );
  }
}
