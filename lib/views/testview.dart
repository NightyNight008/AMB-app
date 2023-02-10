import 'package:amb_app/custom%20widgets/cardbutton.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';

class testview extends StatefulWidget {
  const testview({Key? key}) : super(key: key);

  @override
  State<testview> createState() => _testviewState();
}

class _testviewState extends State<testview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context)
      //         .pushNamedAndRemoveUntil(loginRoute, (route) => false);
      //   },
      //   child: const Text('Login'),
      // ),
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
                        "ing incidents,press this buttonIn case of life threatening incidents,press this buttonIn case of life threatening incidents,press this buttonIn case of life threatening incidents,press this button",
                    link: "assets/images/icu.jpg",
                    pressbutton: 'Request'),

                const SizedBox(
                  height: 5,
                ),
                // *****till here
                const SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
        ),
      ),

      bottomSheet: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Pressable_Button(
            onTap: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            buttontext: 'Login',
            horizontalLength: 5,
            verticallength: 30,
          ),
        ),
      ),
    );
  }
}
