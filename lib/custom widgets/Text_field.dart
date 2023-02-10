// ignore_for_file: non_constant_identifier_names, camel_case_types, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

class text_Field extends StatelessWidget {
  text_Field({
    required this.texthint,
    this.obscure_text = false,
    required this.reference,
    Key? key,
  }) : super(key: key);

  String texthint;
  bool obscure_text;
  TextEditingController reference;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          controller: reference,
          obscureText: obscure_text,
          decoration:
              InputDecoration(border: InputBorder.none, hintText: texthint),
        ),
      ),
    );
  }
}
