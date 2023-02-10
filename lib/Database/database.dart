import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';

class Database extends StatefulWidget {
  const Database({super.key});

  @override
  State<Database> createState() => _DatabaseState();
}

class _DatabaseState extends State<Database> {
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
      body: Column(
        children: [
          Pressable_Button(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(writeroute, (route) => false);
              },
              buttontext: 'Write to database'),
          Pressable_Button(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(readroute, (route) => false);
              },
              buttontext: 'Read from database'),
        ],
      ),
    );
  }
}
