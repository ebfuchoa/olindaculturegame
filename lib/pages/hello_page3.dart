import 'package:flutter/material.dart';
import 'package:olingame/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página 3"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        "Voltar",
        onPressed: () => _onClickVoltar(context),
      ),
    );
  }

  bool _onClickVoltar(context) {
    Navigator.pop(context, "Page 3");
  }
}
