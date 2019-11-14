import 'dart:io';

import 'package:flutter/material.dart';
import 'package:olingame/pages/splashes/splash_roteiro_1.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("OlinGame - Cultura e Educação"),
              accountEmail: Text("olingame@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/olinda.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("História de Olinda"),
              subtitle: Text("Mais informações"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Item 1");
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SplashRoteiro1()));
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Pontos Turísticos"),
              subtitle: Text("Mais informações"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.transfer_within_a_station),
              title: Text("Sobre o QUIZ"),
              subtitle: Text("Mais informações"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              subtitle: Text("Fechar o app"),
              trailing: Icon(Icons.close),
              onTap: () => exit(0),
            )
          ],
        ),
      ),
    );
  }
}
