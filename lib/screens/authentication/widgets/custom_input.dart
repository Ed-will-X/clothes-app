import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    this.onChanged,
    this.icon,
    this.placeholder,
    this.keyboardType,
    this.obscureText = false,
    this.isError = false,
  });

  Icon icon;
  String placeholder;
  TextInputType keyboardType;
  bool obscureText;
  Function onChanged;
  bool isError;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FD),
        borderRadius: BorderRadius.circular(30.0),
        border: isError ? Border.all(color: Colors.redAccent) : null,
      ),
      margin: EdgeInsets.symmetric(horizontal: 24),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              onChanged: onChanged,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: placeholder,
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            child: icon,
          ),
        ],
      ),
    );
  }
}
