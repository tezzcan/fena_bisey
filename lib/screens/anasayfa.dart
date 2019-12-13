import 'package:fena_bisey/widgets/myDrawer.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnasayfaState();
}

class _AnasayfaState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Anasayfa'),
      ),
      body: Container(
        child: Center(
          child: Text('Anasayfa'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
