import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Pressable_Button extends StatelessWidget {
  Pressable_Button({
    required this.onTap,
    required this.buttontext,
    this.horizontalLength,
    this.verticallength,
    this.buttonbackgroundcolor,
    Key? key,
  }) : super(key: key);

  VoidCallback onTap;
  String buttontext;
  double? horizontalLength;
  double? verticallength;
  Color? buttonbackgroundcolor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: buttonbackgroundcolor ?? Colors.blue,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
            horizontal: horizontalLength ?? 50, vertical: verticallength ?? 20),
      ),
      child: Text(buttontext),
    );
  }
}
