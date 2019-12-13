import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GirisEkrani extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  final emailKontrolcusu = TextEditingController();
  final sifreKontrolcusu = TextEditingController();
  final genelKontrolcu = GlobalKey<FormState>();

  @override
  void dispose() {
    emailKontrolcusu.dispose();
    sifreKontrolcusu.dispose();
    super.dispose();
  }

  void girisYap() {
    if (genelKontrolcu.currentState.validate()) {
      if (emailKontrolcusu.text == 'test' && sifreKontrolcusu.text == '1234') {
        Navigator.pushReplacementNamed(context, "/anasayfa");
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Hata",
          desc: "Kullanıcı adı veya şifre hatalı",
          buttons: [
            DialogButton(
              child: Text(
                "Tamam",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        emailKontrolcusu.clear();
        sifreKontrolcusu.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hoşgeldiniz'),
      ),
      body: Form(
        key: genelKontrolcu,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (email) {
                  if (email.isEmpty) {
                    return 'Bu kısım boş bırakılamaz';
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailKontrolcusu,
                decoration: InputDecoration(
                  labelText: 'Email:',
                  icon: new Icon(
                    Icons.mail,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                validator: (sifre) {
                  if (sifre.isEmpty) {
                    return 'Bu kısım boş bırakılamaz';
                  }
                },
                obscureText: true,
                controller: sifreKontrolcusu,
                decoration: InputDecoration(
                  labelText: 'Şifre:',
                  icon: new Icon(
                    Icons.lock,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                  'Giriş',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () => girisYap(),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
