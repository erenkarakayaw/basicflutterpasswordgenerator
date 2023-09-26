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
    "numbers_eng": "Numbers"
  };

  Map<String, String> DilKey = {"_tr": "TR", "_eng": "ENG"};

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
          ElevatedButton(
              onPressed: () => {},
              child: Text(
                "Dil: ${DilKey[dil]}",
                style: TextStyle(color: bizimsiyah),
              ))
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
            )
          ],
        ),
      ),
    );
  }
}
