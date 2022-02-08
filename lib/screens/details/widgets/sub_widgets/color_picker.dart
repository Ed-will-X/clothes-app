import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  bool outerBorder;
  Color color;

  ColorPicker(outerBorder, color) {
    this.outerBorder = outerBorder;
    this.color = color;
  }
  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: widget.outerBorder
            ? Border.all(color: widget.color, width: 2)
            : null,
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: widget.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
