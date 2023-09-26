import 'package:flutter/material.dart';

class specialListitem extends StatefulWidget {

  final String text;

  specialListitem({required this.text});

  @override
  _specialListitem createState() => _specialListitem();
}

class _specialListitem extends State<specialListitem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        textColor: Colors.white,
        hoverColor: Colors.black,
        focusColor: Colors.black,
        selectedColor: Colors.black,
        title: Text(widget.text),
      ),
    );
  }
}
