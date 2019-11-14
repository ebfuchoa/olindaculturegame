import 'package:flutter/material.dart';
import 'package:olingame/model/lugar.dart';
import 'package:olingame/pages/lugar_page.dart';
import 'package:olingame/utils/utils.dart';

class Roteiro2Page extends StatefulWidget {

  @override
  _Roteiro2PageState createState() => _Roteiro2PageState();
}

class _Roteiro2PageState extends State<Roteiro2Page> {
  bool _gridview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {

    List<Lugar> lugares = [
      Lugar("Museu de Arte Contemporânea (MAC)", "assets/images/roteiro2/r2_1_MAC.jpg"),
      Lugar("Prefeitura de Olinda", "assets/images/roteiro2/r2_2_prefeitura.jpg"),
      Lugar("Mosteiro de São Bento", "assets/images/roteiro2/r2_3_mosteiroSB.jpg"),
      Lugar("Sede da pitombeira dos quatro cantos", "assets/images/roteiro2/r2_4_sedePitombeira.jpg"),
      Lugar("Sobrado mourisco", "assets/images/roteiro2/r2_5_mourisco.jpg"),
      Lugar("Igreja de São Pedro Apóstolo", "assets/images/roteiro2/r2_6_igrejaSPApostolo.jpg"),
      Lugar("Casa Vermelha", "assets/images/roteiro2/r2_7_casaVermelha.jpg"),
      Lugar("Praça do carmo", "assets/images/roteiro2/r2_8_pracaCarmo.jpg"),
    ];

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: lugares.length,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(lugares, index);
        });
  }

  _itemView(List<Lugar> lugares, int index) {
    Lugar lugar = lugares[index];

    return GestureDetector(
      onTap: (){
        push(context, LugarPage(lugar));
      },
      child: Stack(
        fit: StackFit.expand  ,
        children: <Widget>[
          _img(lugar.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Text(lugar.nome,
                style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
