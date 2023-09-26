import 'dart:html';

import 'package:flutter/material.dart';
import 'checkBoxArea.dart';
import 'pwdLengthArea.dart';

class appBody extends StatefulWidget {
  @override
  _appBody createState() => _appBody();
}

class _appBody extends State<appBody> {
  double _slidervalue = 16;

  bool _uppercase = true;

  bool _numbers = false;

  bool _specialch = false;

  Color bizimyesil = Color.fromARGB(255, 112, 148, 122);

  Color bizimsiyah = Color.fromARGB(255, 57, 64, 59);

  String dil = "_eng";

  Map<String, String> keyler = {
    "appbartext_tr": "Şifre Oluşturucu",
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
    "generate_eng": "Generate"
  };

  Map<String, String> DilKey = {
    "_tr": "images/tur.png",
    "_eng": "images/uk.png"
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

  String GetKey(String key) {
    String ct = "$key$dil";
    return keyler[ct].toString();
  }

  void setSliderVal(double val) {
    setState(() {
      _slidervalue = val.toInt() as double;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bizimsiyah,
      appBar: AppBar(
        backgroundColor: bizimyesil,
        centerTitle: true,
        title:
            Text(GetKey("appbartext"), style: TextStyle(color: Colors.white70)),
        actions: <Widget>[
          IconButton(
            onPressed: () => {changeLanguage()},
            icon: Image.asset(
              DilKey[dil].toString(),
              width: 50,
              height: 50,
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
            Container(
              width: 200,
              height: 45,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: bizimyesil,
                  foregroundColor: bizimsiyah,
                  shadowColor: null
                ),
                child: Text(GetKey("generate"),style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
