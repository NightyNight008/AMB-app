import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/views/RegisterPage_options.dart';
import 'package:amb_app/views/ProfilePage.dart';
import 'package:amb_app/views/home_view.dart';
import 'package:amb_app/views/login_view.dart';
import 'package:amb_app/views/register_View.dart';
import 'package:flutter/material.dart';

import 'views/Maps.dart';

void main() {
  //read architectural overview of flutter in site,to know about line widejetflutter binding
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      // initialRoute: '/Homepage/',
      debugShowCheckedModeBanner: false,
      title: 'Amb App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        register2Route: (context) => const RegisterOptions(),
        homepageRoute: (context) => const HomePage(),
        profilepageroute: (context) => const Profilepage(),
        mapsroute: (context) => const Maps(),
      },
    ),
  );
}
