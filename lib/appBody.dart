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
        title: Text("Basic Pasword Generator",
            style: TextStyle(color: Colors.white70)),
      ),
      body: Center(
        child: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child:
                      Text("Upper Case", style: TextStyle(color: Colors.white)),
                ),
                Container(
                  width: 50,
                  child: Checkbox(
                    value: _uppercase,
                    focusColor: bizimyesil,
                    activeColor: bizimyesil,
                    
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      if (!states.contains(MaterialState.selected)) {
                        return bizimsiyah;
                      }
                      return null;
                    }),
                    onChanged: (e) => {setUpperCase(e)},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
