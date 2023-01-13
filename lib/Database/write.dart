import 'package:amb_app/constant/routes.dart';
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
  final database = FirebaseDatabase.instance.ref();
  //<databaseRef>.set()
  //set = set a value in your database
  @override
  Widget build(BuildContext context) {
    final dailySpecialRef = database.child('dailyspecial/');
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
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await dailySpecialRef
                          .set({'description': 'vanilla latte', 'price': 4.99});
                      print('written');
                    } catch (e) {
                      print('You got error $e');
                      showErrorDialog(
                        context,
                        'Error',
                      );
                    }
                  },
                  child: const Text('Simple set'),
                ),
              ]);
            default:
              return const CircularProgressIndicator();
          }
        },
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
