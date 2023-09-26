import 'package:flutter/material.dart';

class checkBoxArea extends StatefulWidget {

  final String localkey;

  final bool value;

  final Function onChanged;

  const checkBoxArea({required this.localkey, required this.value, required this.onChanged});


  @override
  _checkBoxArea createState() => _checkBoxArea();
}

class _checkBoxArea extends State<checkBoxArea> {

  Color bizimyesil = Color.fromARGB(255, 112, 148, 122);

  Color bizimsiyah = Color.fromARGB(255, 57, 64, 59);



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          child:
              Text(widget.localkey, style: TextStyle(color: Colors.white)),
        ),
        Container(
          width: 30,
          child: Checkbox(
            value: widget.value,
            focusColor: bizimyesil,
            activeColor: bizimyesil,
            side: const BorderSide(color: Colors.white),
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (!states.contains(MaterialState.selected)) {
                return bizimsiyah;
              }
              return null;
            }),
            onChanged: (e) => widget.onChanged(e),
          ),
        ),
        Container(
          width: 70,
        )
      ],
    );
  }
}
