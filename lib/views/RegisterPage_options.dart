// ignore_for_file: file_names

import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

class RegisterOptions extends StatefulWidget {
  const RegisterOptions({Key? key}) : super(key: key);

  @override
  State<RegisterOptions> createState() => _RegisterOptionsState();
}

class _RegisterOptionsState extends State<RegisterOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        registerRoute, (route) => false);
                  },
                  buttontext: 'Register As Customer'),
              const SizedBox(
                height: 25,
              ),
//********************************Login as driver */
              Pressable_Button(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      registerdriverroute, (route) => false);
                },
                buttontext: 'Register As Driver',
                horizontalLength: 65,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
