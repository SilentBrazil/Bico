import 'package:flutter/material.dart';

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Bico",style: TextStyle(color: Colors.white)),
            accountEmail: Text("bico@silent.com.br",style: TextStyle(color: Colors.white)),
            currentAccountPicture: CircleAvatar(
              backgroundColor:
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.white
                  : Colors.white,
              child: Text(
                "B",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
            /*child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Let's go BICO",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.deepOrange, Colors.orangeAccent]),
              ),*/
          ),
          ListTile(
            //leading: Icon(Icons.category),
            title: Text(
              'Notificações',
            ),
          ),
          ListTile(
            title: Text("Seus serviços"),
          ),
          ListTile(
            title: Text("Ajuda"),
          ),
          ListTile(
            title: Text("Perfil"),
          ),
          ListTile(
            title: Text("Configurações"),
          ),
        ],
      ),
    );
  }
}
