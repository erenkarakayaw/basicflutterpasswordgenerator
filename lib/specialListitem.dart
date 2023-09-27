import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

class specialListitem extends StatefulWidget {

  final String text;

  final String copytext;

  specialListitem({required this.text, required this.copytext});

  @override
  _specialListitem createState() => _specialListitem();
}

class _specialListitem extends State<specialListitem> {

  Color bizimyesil = Color.fromARGB(255, 112, 148, 122);

  bool _selected = false;

  Color basildimi() {
    if (_selected) return bizimyesil;
    else return Color.fromARGB(255, 35, 35, 35);
  }

  void Select() {
    setState(() {
      _selected = !_selected;
    });
    FlutterClipboard.copy(widget.text);
  }

  void Disable() {
    setState(() {
      _selected = false;
    });
  }

  ListTile Dondur() {
    if (_selected){
      return ListTile(
        textColor: Colors.white,
        hoverColor: Colors.black,
        focusColor: Colors.black,
        selectedColor: Colors.black,
        title: Text(widget.text),
        subtitle: Text(widget.copytext),
        onTap: Select,
      );
    }
    else return ListTile(
      textColor: Colors.white,
      hoverColor: Colors.black,
      focusColor: Colors.black,
      selectedColor: Colors.black,
      title: Text(widget.text),
      onTap: Select,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: basildimi(),
      child: Dondur(),
    );
  }
}
