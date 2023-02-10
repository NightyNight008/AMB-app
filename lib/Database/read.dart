import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  Query dbref = FirebaseDatabase.instance.ref().child('Drivers');
  Widget listitem({required Map Drivers}) {
    return Container(
      height: 110,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.amber,
      child: Column(
        children: [
          Text(
            Drivers['name'],
          ),
          Text(Drivers['age']),
          Text(Drivers['Salary']),
        ],
      ),
    );
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
        title: const Text('Write Examples'),
      ),
      body: Container(
        child: FirebaseAnimatedList(
            query: dbref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map drivers = snapshot.value as Map;
              drivers['key'] = snapshot.key;

              return listitem(Drivers: drivers);
            }),
      ),
    );
  }
}
