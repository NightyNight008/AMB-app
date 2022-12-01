import 'package:amb_app/views/lib/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 253),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Press the buttons as per your need"),
              const SizedBox(
                height: 25,
              ),
              // *******************************************************Emergency button

              Pressable_Button(
                onTap: () {},
                buttontext: 'Emergency',
                buttonbackgroundcolor: const Color.fromARGB(255, 0, 255, 26),
                horizontalLength: 100,
              ),
              const SizedBox(
                height: 25,
              ),
              //*************************************************Life threatening  */

              Pressable_Button(
                onTap: () {},
                buttontext: 'Life Threatening Emergency',
                buttonbackgroundcolor: const Color.fromARGB(255, 255, 0, 0),
              ),

              //*****************************************************/
              const SizedBox(
                height: 100,
              ),
              //*****************************Login Button On Homepage */

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Pressable_Button(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          login2Route, (route) => false);
                    },
                    buttontext: 'Login',
                    horizontalLength: 30,
                  ),

                  const SizedBox(
                    width: 10,
                  ),
                  //****************************8Register Button */
                  Pressable_Button(
                    onTap: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          registerRoute, (route) => false);
                    },
                    buttontext: 'Register',
                    horizontalLength: 30,
                  ),

                  //**********************************************************************/
                ],
              ),
              //****************************Delete this */
              // Pressable_Button(
              //     onTap: () {
              //       Navigator.of(context).pushNamedAndRemoveUntil(
              //           testpageroute, (route) => false);
              //     },
              //     buttontext: "Test"),
            ],
          ),
        ),
      ),
    );
  }
}
