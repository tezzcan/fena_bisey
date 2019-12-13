import 'package:flutter/material.dart';
import '../screens/anasayfa.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDrawer();
}

class _MyDrawer extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 100.0,
                  ),
                  Text(
                    'XXX Robots',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Anasayfa'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/anasayfa");
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_phone),
            title: Text('İletişim'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/iletisim");
            },
          ),
          ListTile(
            leading: Icon(Icons.create),
            title: Text('Servis Formu'),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/servis_formu");
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Çıkış'),
            onTap: () {
              //Navigator.pushNamed(context, "/");
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
        ],
      ),
    );
  }
}
