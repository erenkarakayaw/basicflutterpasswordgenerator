import 'package:flutter/material.dart';

class appBody extends StatefulWidget {
  @override
  _appBody createState() => _appBody();
}

class _appBody extends State<appBody> {
  double _slidervalue = 16;

  bool _uppercase = false;

  Color bizimyesil = Color.fromARGB(255, 112, 148, 122);

  Color bizimsiyah = Color.fromARGB(255, 57, 64, 59);

  String dil = "_eng";

  Map<String, String> keyler = {
    "appbartext_tr": "Şifre Oluşturucu",
    "appbartext_eng": "Basic Password Generator",
    "pwd_tr" : "Şifre Uzunluğu",
    "pwd_eng" : "Password Length",
    "uppercase_tr" : "Büyük Harfler",
    "uppercase_eng" : "Upper Case"
  };

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bizimsiyah,
      appBar: AppBar(
        backgroundColor: bizimyesil,
        centerTitle: true,
        title:
            Text(GetKey("appbartext"), style: TextStyle(color: Colors.white70)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(GetKey("pwd"),
                      style: TextStyle(color: Colors.white)),
                  width: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Slider(
                        value: _slidervalue,
                        max: 32,
                        min: 4,
                        onChanged: (e) => {
                          setSliderVal(e),
                        },
                        activeColor: bizimyesil,
                      ),
                      width: 200,
                    ),
                    Container(
                      width: 50,
                      child: Text(
                        "$_slidervalue",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  child:
                  Text(GetKey("uppercase"), style: TextStyle(color: Colors.white)),
                ),
                Container(
                  width: 30,
                  child: Checkbox(
                    value: _uppercase,
                    focusColor: bizimyesil,
                    activeColor: bizimyesil,
                    side: const BorderSide(color: Colors.white),
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (!states.contains(MaterialState.selected)) {
                        return bizimsiyah;
                      }
                      return null;
                    }),
                    onChanged: (e) => {setUpperCase(e)},
                  ),
                ),
                Container(
                  width: 90,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
