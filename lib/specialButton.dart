import 'package:flutter/material.dart';

class specialButton extends StatefulWidget {

  final double width, height;
  final Color backgroundColor, foregroundColor;
  final String text;
  final Function onPressed;

  specialButton({required this.width, required this.height, required this.backgroundColor, required this.foregroundColor, required this.text, required this.onPressed});

  @override
  _specialButton createState() => _specialButton();
}

class _specialButton extends State<specialButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton(
        onPressed: () => widget.onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            shadowColor: null),
        child: Text(widget.text,
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
