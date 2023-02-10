import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
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
        children: [],
      ),
    );
  }
}
