import 'package:flutter/material.dart';

class appBody extends StatefulWidget {
  @override
  _appBody createState() => _appBody();
}

class _appBody extends State<appBody> {
  double _slidervalue = 16;

  void setSliderVal(double val) {
    setState(() {
      _slidervalue = val.toInt() as double;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 57, 64, 59),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 112, 148, 122),
        centerTitle: true,
        title: Text("Basic Pasword Generator",
            style: TextStyle(color: Colors.white70)),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Pasword length",
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
                        min: 0,
                        onChanged: (e) => {
                          setSliderVal(e),
                        },
                        activeColor: Color.fromARGB(255, 112, 148, 122),
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
            )
          ],
        ),
      ),
    );
  }
}
