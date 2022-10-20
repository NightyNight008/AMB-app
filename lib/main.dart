import 'package:amb_app/views/LoginPage_options.dart';
import 'package:amb_app/views/home_view.dart';
import 'package:amb_app/views/login_view.dart';
import 'package:amb_app/views/register_View.dart';
import 'package:flutter/material.dart';

void main() {
  //read architectural overview of flutter in site,to know about line widejetflutter binding
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Amb App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginOptions(),
    ),
  );
}
