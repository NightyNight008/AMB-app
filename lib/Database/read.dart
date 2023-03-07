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
  final ref = FirebaseDatabase.instance.ref('User');

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
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: ref.onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: const CircularProgressIndicator());
                } else {
                  Map<dynamic, dynamic> map =
                      snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list.clear();
                  list = map.values.toList();
                  return ListView.builder(
                    itemCount: snapshot.data!.snapshot.children.length,
                    itemBuilder: ((context, index) {
                      return ListTile(
                        title: Text(list[index]['name']),
                      );
                    }),
                  );
                }
              },
            ),
          ),
          // Expanded(
          //   child: FirebaseAnimatedList(
          //     query: ref,
          //     defaultChild: const CircularProgressIndicator(strokeWidth: 10),
          //     itemBuilder: (context, snapshot, animation, index) {
          //       return ListTile(
          //         title: Text(snapshot.child('Name').value.toString()),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
