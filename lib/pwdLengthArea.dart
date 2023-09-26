import 'package:flutter/material.dart';

class pwdLengthArea extends StatefulWidget {
  final double value;
  final String text;
  final Function onChanged;

  pwdLengthArea({required this.value, required this.text, required this.onChanged});

  @override
  _pwdLengthArea createState() => _pwdLengthArea();
}

class _pwdLengthArea extends State<pwdLengthArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(widget.text, style: TextStyle(color: Colors.white)),
          width: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Slider(
                value: widget.value,
                max: 32,
                min: 4,
                onChanged: (e) => widget.onChanged(e),
                activeColor: Color.fromARGB(255, 112, 148, 122),
              ),
              width: 200,
            ),
            Container(
              width: 50,
              child: Text(
                widget.value.toString(),
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )
      ],
    );
  }
}
