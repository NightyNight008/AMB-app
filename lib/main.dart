import 'package:amb_app/Database/database.dart';
import 'package:amb_app/Database/read.dart';
import 'package:amb_app/Database/write.dart';
import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/views/registerpage_options.dart';
import 'package:amb_app/views/profilePage.dart';
import 'package:amb_app/views/home_view.dart';
import 'package:amb_app/views/login_view.dart';
import 'package:amb_app/views/testview.dart';
import 'package:amb_app/views/user_profileoptions.dart';
import 'package:amb_app/views/profile_home_navbar.dart';
import 'package:amb_app/views/register_View.dart';
import 'package:amb_app/views/register_pageDriver.dart';
import 'package:amb_app/views/verify_email_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'views/maps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amb App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        register2Route: (context) => const RegisterOptions(),
        homepageRoute: (context) => const HomePage(),
        profilepageroute: (context) => const Profilepage(),
        mapsroute: (context) => const Maps(),
        registerdriverroute: (context) => const RegisterDriver(),
        profilePhome: (context) => const ProfilePhome(),
        useroptionsroute: (context) => const UserOptions(),
        databaseroute: (context) => const Database(),
        readroute: (context) => const Read(),
        writeroute: (context) => const Write(),
        verifyroute: (context) => const VerifyEmailView(),
      },
    ),
  );
}
