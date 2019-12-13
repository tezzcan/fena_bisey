import 'package:flutter/material.dart';
import './screens/anasayfa.dart';
import './screens/iletisim.dart';
import './screens/servis_formu.dart';
import './screens/girisekrani.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => GirisEkrani(),
        "/anasayfa": (context) => Anasayfa(),
        "/iletisim": (context) => Iletisim(),
        "/servis_formu": (context) => ServisFormu(),
      },
      //home: new LoginSignupPage()
    ),
  );
}
