import 'package:fena_bisey/widgets/myDrawer.dart';
import 'package:flutter/material.dart';

class Iletisim extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IletisimState();
}

class _IletisimState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('İletişim'),
      ),
      body: Container(
        child: Center(
          child: Text('İletişim'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
