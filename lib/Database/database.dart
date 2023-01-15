import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Pressable_Button(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(writeroute, (route) => false);
                  },
                  buttontext: 'Write'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Pressable_Button(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(readroute, (route) => false);
                    },
                    buttontext: 'Read'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
