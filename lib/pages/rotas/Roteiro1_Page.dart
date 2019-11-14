import 'package:flutter/material.dart';
import 'package:olingame/model/lugar.dart';
import 'package:olingame/pages/lugar_page.dart';
import 'package:olingame/utils/utils.dart';

class Roteiro1Page extends StatefulWidget {

  @override
  _Roteiro1PageState createState() => _Roteiro1PageState();
}

class _Roteiro1PageState extends State<Roteiro1Page> {
  bool _gridview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    List<Lugar> lugares = [
      Lugar("Igreja do Amparo", "assets/images/roteiro1/r1_1_igrejaAmparo.jpg"),
      Lugar("Igreja de São João Batista dos Militares", "assets/images/roteiro1/r1_2_igrejaJBMilitares.jpg"),
      Lugar("Sede do Homem da Meia Noite", "assets/images/roteiro1/r1_3_sedeHomemMN.jpg"),
      Lugar("Igreja do Rosário dos Homens Pretos", "assets/images/roteiro1/r1_4_igrejaRHomensPretos.jpg"),
      Lugar("Museu Regional de Olinda", "assets/images/roteiro1/r1_5_museuRegional.jpg"),
      Lugar("Quatro cantos", "assets/images/roteiro1/r1_6_quatroCantos.jpg"),
      Lugar("Mercado da Ribeira", "assets/images/roteiro1/r1_7_mercadoRibeira.jpg"),
      Lugar("Ruínas do Antigo Senado", "assets/images/roteiro1/r1_8_ruinasAntigoSenado.jpg"),
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
        fit: StackFit.expand,
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
