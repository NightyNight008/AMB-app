import 'package:amb_app/Database/database.dart';
import 'package:amb_app/Database/read.dart';
import 'package:amb_app/Database/write.dart';
import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/views/RegisterPage_options.dart';
import 'package:amb_app/views/ProfilePage.dart';
import 'package:amb_app/views/home_view.dart';
import 'package:amb_app/views/login_view.dart';
import 'package:amb_app/views/user_profileoptions.dart';
import 'package:amb_app/views/profile_home_navbar.dart';
import 'package:amb_app/views/register_View.dart';
import 'package:amb_app/views/register_pageDriver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'views/Maps.dart';

void main() async {
  //widget flutter bindings
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
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
        registerdriverroute: (context) => const RegisterDriver(),
        profilePhome: (context) => const ProfilePhome(),
        useroptionsroute: (context) => const UserOptions(),
        databaseroute: (context) => const Database(),
        readroute: (context) => const Read(),
        writeroute: (context) => const Write(),
      },
    ),
  );
}

// class Mainpage extends StatelessWidget {
//   const Mainpage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Firebase.initializeApp(
//         options: DefaultFirebaseOptions.currentPlatform,
//       ),
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.done:
//             final user = FirebaseAuth.instance.currentUser;
//             if (user != null) {
//               if (user.emailVerified == true) {
//                 return const ProfilePhome();
//               } else {
//                 return const HomePage();
//               }
//             } else {
//               return const HomePage();
//             }

//           //I dont get this line
//           // devtools.log(user);
//           // if (user?.emailVerified ?? false) {
//           //   return const Text('Done');
//           // } else {
//           //   return const VerifyEmailView();
//           // }
//           default:
//             return const CircularProgressIndicator();
//           // }
//         }
//       },
//     );
//   }
// }

// enum MenuAction { logout }
