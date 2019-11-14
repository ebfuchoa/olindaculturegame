import 'package:flutter/material.dart';
import 'package:olingame/model/lugar.dart';
import 'package:olingame/pages/lugar_page.dart';
import 'package:olingame/utils/utils.dart';

class Roteiro3Page extends StatefulWidget {

  @override
  _Roteiro3PageState createState() => _Roteiro3PageState();
}

class _Roteiro3PageState extends State<Roteiro3Page> {
  bool _gridview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {

    List<Lugar> lugares = [
      Lugar("Igreja do Carmo", "assets/images/roteiro3/r3_1_igrejaCarmo.jpg"),
      Lugar("Biblioteca Pública", "assets/images/roteiro3/r3_2_bibliotecaPublica.jpg"),
      Lugar("Convento Franciscano", "assets/images/roteiro3/r3_3_conventoFranciscano.jpg"),
      Lugar("Seminário de Olinda", "assets/images/roteiro3/r3_4_seminario.jpg"),
      Lugar("Igreja da Sé", "assets/images/roteiro3/r3_5_igrejaSe.jpg"),
      Lugar("Museu de Arte Sacra", "assets/images/roteiro3/r3_6_museuArteSacra.jpg"),
      Lugar("Observatório Astronômico", "assets/images/roteiro3/r3_7_observatorio.jpg"),
      Lugar("Convento da Conceição", "assets/images/roteiro3/r3_8_conventoConceicao.jpg"),
      Lugar("Academia Santa Gertrudes", "assets/images/roteiro3/r3_9_academiaSG.jpg"),
      Lugar("Igreja da Misericórdia", "assets/images/roteiro3/r3_10_igrejaMisericordia.jpg"),
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
