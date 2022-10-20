import 'package:amb_app/views/login_view.dart';
import 'package:amb_app/views/register_View.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 224, 232),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      "Life Threatening Emergency",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Colors.brown,
                  ),
                  child: const Center(
                    child: Text(
                      "Emergency",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         Navigator.of(context).pushNamedAndRemoveUntil(
              //             login2Route, (route) => false);
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.all(18.0),
              //         decoration: BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.blue,
              //         ),
              //         child: const Center(
              //           child: Text(
              //             "Login",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FabCircularMenu(
        fabOpenColor: Colors.yellow,
        fabCloseColor: Colors.white,
        ringColor: Colors.yellow,
        alignment: Alignment.bottomCenter,
        ringDiameter: 300,
        children: [
          InkWell(
              child: const Icon(Icons.app_registration_rounded),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const RegisterPage(),
                  ),
                );
              }),
          InkWell(
              child: const Icon(Icons.login),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
