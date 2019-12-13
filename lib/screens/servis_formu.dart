import 'package:fena_bisey/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as PdfWidgets;
import 'dart:io';

class ServisFormu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ServisFormuState();
}

class _ServisFormuState extends State {
  final adKontrolcusu =
      TextEditingController(); //! her bir tff icin gerekio olabilir bunun icin
  final soyadKontrolcusu = TextEditingController(); // ? öyleymiş :)))
  final genelKontrolcu = GlobalKey<FormState>();
  final pdf = PdfWidgets.Document();

  @override
  void dispose() {
    adKontrolcusu.dispose();
    soyadKontrolcusu.dispose();
    super.dispose();
  }

  void foo() {
    if (genelKontrolcu.currentState.validate()) {
      debugPrint('Giris kaydı alındı: ${adKontrolcusu.text} ' +
          '${soyadKontrolcusu.text}');
    }
  }

  void pdfCikti() {
    pdf.addPage(
      PdfWidgets.Page(
        pageFormat: PdfPageFormat.a4,
        build: (PdfWidgets.Context context) {
          return PdfWidgets.Center(
            child: PdfWidgets.Text("Hello World"),
          ); // Center
        },
      ),
    );

    final File file = File('example.pdf');
    file.writeAsBytesSync(pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Servis Formu'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () => pdfCikti(),
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Form(
        key: genelKontrolcu,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (yazi) {
                  if (yazi.isEmpty) {
                    return 'Lütfen bu kısmı boş bırakmayın';
                  }
                },
                controller: adKontrolcusu,
                decoration: InputDecoration(
                  labelText: 'Ad:',
                ),
              ),
              TextFormField(
                validator: (soyad) {
                  if (soyad.isEmpty) {
                    return 'Lütfen bu kısmı boş bırakmayın';
                  }
                },
                controller: soyadKontrolcusu,
                decoration: InputDecoration(
                  labelText: 'Soyad:',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () => foo(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: MyDrawer(),
    );
  }
}
