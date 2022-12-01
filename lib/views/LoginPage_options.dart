// ignore_for_file: file_names

import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/views/lib/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(homepageRoute, (route) => false);
          },
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //**************************Login as customer */

              Pressable_Button(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  },
                  buttontext: 'Login As Customer'),
              const SizedBox(
                height: 25,
              ),
//********************************Login as driver */
              Pressable_Button(
                onTap: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                buttontext: 'Login As Driver',
                horizontalLength: 65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
