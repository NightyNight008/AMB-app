import 'package:amb_app/custom%20widgets/cardbutton.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 8),
      //   height: 60,
      //   width: double.infinity,
      //   margin: const EdgeInsets.symmetric(
      //     horizontal: 8,
      //   ),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(40),
      //     color: Colors.purple,
      //   ),
      //   child: const Text(
      //     'Login',
      //     textAlign: TextAlign.center,
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(loginRoute, (route) => false);
        },
        child: const Text('Login'),
      ),

      backgroundColor: const Color.fromARGB(255, 253, 252, 253),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // *******************************************************Emergency button

                CardButton(
                    tap: () {},
                    text: 'For Normal Cases',
                    details:
                        "In case of minor injury and other medical help press this button.In case of minor injury and other medical help press this button.In case of minor injury and other medical help press this button.In case of minor injury and other medical help press this button.",
                    link: "assets/images/injured.jpg",
                    pressbutton: 'Request'),

                //*************************************************Life threatening  */
                const SizedBox(
                  height: 10,
                ),
                CardButton(
                    tap: () {},
                    text: 'For emergency cases',
                    details:
                        "In case of life threatening incidents,press this button.In case of life threatening incidents,press this buttonIn case of life threatening incidents,press this buttonIn case of life threatening incidents,press this buttonIn case of life threatening incidents,press this button",
                    link: "assets/images/icu.jpg",
                    pressbutton: 'Request'),

                //*****************************************************/
                //*****************************Login Button On Homepage */

                // Center(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Pressable_Button(
                //         onTap: loginRoute,
                //         buttontext: 'Login',
                //         horizontalLength: 90,
                //       ),

                //       const SizedBox(
                //         width: 10,
                //       ),
                //       //****************************Register Button */
                //       Pressable_Button(
                //         onTap: register2Route,
                //         buttontext: 'Register',
                //         horizontalLength: 90,
                //       ),

                //       //**********************************************************************/
                //     ],
                //   ),
                // ),

                //REmove this
                const SizedBox(
                  height: 5,
                ),
                Pressable_Button(onTap: databaseroute, buttontext: 'Database'),
                // *****till here
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
