import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(yemek());
}

class yemek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          centerTitle: true,
          title: Text(
            "Bugün Ne Yesem ?",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        body: yemeksayfasi(),
      ),
    );
  }
}

class yemeksayfasi extends StatefulWidget {
  @override
  State<yemeksayfasi> createState() => _yemeksayfasiState();
}

class _yemeksayfasiState extends State<yemeksayfasi> {
  int corbaNo = 1;

  int yemekNo = 2;

  int tatliNo = 3;
  List<String> corbaAdlari = [
    'Mercimek',
    "Tarhana",
    "Tavuk Suyu",
    "Düğün Çorbasi",
    "Yoğurt Çorbasi"
  ];
  List<String> yemekAdlari = [
    "Karnıyarık",
    "Mantı",
    "Kurufasulye",
    "İçli Köfte",
    "Izgara Balık"
  ];
  List<String> tatliAdlari = [
    "Kadayıf",
    "Baklava",
    "Sütlaç",
    "Kazandibi",
    "Dondurma"
  ];
  void yemekleriyenile() {
    setState(() {
      corbaNo = Random().nextInt(5) + 1;
      tatliNo = Random().nextInt(5) + 1;
      yemekNo = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Expanded(
                child: ElevatedButton(
              onPressed: () {
                setState(() {
                  yemekleriyenile();
                  print("corba no  = $corbaNo");
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Image.asset("assets/images/corba_$corbaNo.jpg"),
            )),
          )),
          Text(
            corbaAdlari[corbaNo - 1],
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    yemekleriyenile();
                    print("Yemek No = $yemekNo");
                  });
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Image.asset("assets/images/yemek_$yemekNo.jpg")),
          )),
          Text(
            yemekAdlari[yemekNo - 1],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          yemekleriyenile();
                        });
                        print("Tatlı No = $tatliNo");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: Image.asset("assets/images/tatli_$tatliNo.jpg")))),
          Text(
            tatliAdlari[tatliNo - 1],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
