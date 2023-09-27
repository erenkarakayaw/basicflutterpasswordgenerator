import 'package:flutter/material.dart';
import 'checkBoxArea.dart';
import 'pwdLengthArea.dart';
import 'specialButton.dart';
import 'specialListitem.dart';
import 'passwordGenerator.dart';
import 'dart:math';

class appBody extends StatefulWidget {
  @override
  _appBody createState() => _appBody();
}

class _appBody extends State<appBody> {
  double _slidervalue = 4;

  bool _uppercase = true;

  bool _numbers = false;

  bool _specialch = false;

  Color bizimyesil = Color.fromARGB(255, 112, 148, 122);

  Color bizimsiyah = Color.fromARGB(255, 57, 64, 59);

  String dil = "_eng";

  Map<String, String> keyler = {
    "appbartext_tr": "Basit Şifre Oluşturucu",
    "appbartext_eng": "Basic Password Generator",
    "pwd_tr": "Şifre Uzunluğu",
    "pwd_eng": "Password Length",
    "uppercase_tr": "Büyük Harfler",
    "uppercase_eng": "Upper Case",
    "numbers_tr": "Sayılar",
    "numbers_eng": "Numbers",
    "specialch_tr": "Özel Karakter",
    "specialch_eng": "Special Character",
    "generate_tr": "Oluştur",
    "generate_eng": "Generate",
    "copytext_tr": "Metin Kopyalandı",
    "copytext_eng": "Text Copied."
  };

  Map<String, String> DilKey = {
    "_tr": "assets/images/tur.png",
    "_eng": "assets/images/uk.png"
  };

  void changeLanguage() {
    if (dil == "_tr") {
      setState(() {
        dil = '_eng';
      });
    } else {
      setState(() {
        dil = '_tr';
      });
    }
  }

  ScrollController sc = ScrollController();

  List<String> _sifre_liste = [];

  String GetKey(String key) {
    String ct = "$key$dil";
    return keyler[ct].toString();
  }

  void sifreListeGuncelle(String sifre) {
    setState(() {
      _sifre_liste.add(sifre);
    });
  }

  void setSliderVal(double val) {
    setState(() {
      _slidervalue = val as double;
    });

  }

  void setUpperCase(val) {
    setState(() {
      _uppercase = val as bool;
    });
  }

  void setNumbers(val) {
    setState(() {
      _numbers = val as bool;
    });
  }

  void setSpecialCH(val) {
    setState(() {
      _specialch = val as bool;
    });
  }

  double _bosvalue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bizimsiyah,
      appBar: AppBar(
        backgroundColor: bizimyesil,
        centerTitle: true,
        title: Text(GetKey("appbartext"),
            style: TextStyle(color: Colors.white70, fontSize: 20)),
        actions: <Widget>[
          IconButton(
            onPressed: () => {changeLanguage()},
            icon: Image.asset(
              DilKey[dil].toString(),
              width: 40,
              height: 40,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pwdLengthArea(
                value: _slidervalue,
                text: GetKey("pwd"),
                onChanged: setSliderVal),
            Container(
              height: 20,
            ),
            checkBoxArea(
                localkey: GetKey("uppercase"),
                onChanged: setUpperCase,
                value: _uppercase),
            Container(
              height: 20,
            ),
            checkBoxArea(
                localkey: GetKey("numbers"),
                value: _numbers,
                onChanged: setNumbers),
            Container(
              height: 20,
            ),
            checkBoxArea(
                localkey: GetKey("specialch"),
                value: _specialch,
                onChanged: setSpecialCH),
            Container(
              height: 40,
            ),
            specialButton(
                width: 200,
                height: 45,
                backgroundColor: bizimyesil,
                foregroundColor: bizimsiyah,
                text: GetKey("generate"),
                onPressed: () => sifreListeGuncelle(PasswordGenerator.Generate(
                    _slidervalue.toInt(), _uppercase, _specialch, _numbers))),
            Container(
              height: 40,
            ),
            Flexible(
              child: Container(
                width: 600,
                height: 300,
                color: Color.fromARGB(255, 35, 35, 35),
                child: Scrollbar(
                  controller: sc,
                  interactive: true,
                  thickness: 25,
                  thumbVisibility: true,
                  trackVisibility: true,
                  child: ListView.builder(
                    itemCount: _sifre_liste.length,
                    controller: sc,
                    itemBuilder: (BuildContext context, int index) {
                      return specialListitem(
                        text: _sifre_liste.reversed.toList()[index],
                        copytext: GetKey("copytext"),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
