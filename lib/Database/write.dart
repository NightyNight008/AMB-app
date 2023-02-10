import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final usernameController = TextEditingController();
  final userController = TextEditingController();
  final user2Controller = TextEditingController();
  late DatabaseReference dbref;
  //<databaseRef>.set()
  //set = set a value in your database

  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('Drivers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(databaseroute, (route) => false);
          },
        ),
        title: const Text('Read Examples'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text_Field(texthint: 'Parent', reference: usernameController),
          text_Field(
            texthint: 'Child',
            reference: user2Controller,
          ),
          text_Field(
            texthint: 'Next child',
            reference: userController,
          ),
          Pressable_Button(
              onTap: () {
                Map<String, String> users = {
                  'name': usernameController.text,
                  'user2': userController.text,
                  'user3': user2Controller.text,
                };
                dbref.push().set(users);
                print('Write sucessful');
              },
              buttontext: 'Insert'),
        ],
      ),
    );
  }
}

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Error'),
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          )
        ],
      );
    },
  );
}
