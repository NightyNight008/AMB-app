// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  CardButton({
    required this.tap,
    required this.text,
    required this.details,
    required this.link,
    required this.pressbutton,
    Key? key,
  }) : super(key: key);
  String text;
  VoidCallback tap;
  String details;
  String link;
  String pressbutton;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                link,
                height: 180,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 8,
                right: 8,
                left: 8,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(16).copyWith(bottom: 0),
            child: Text(
              details,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: tap,
                child: Text(pressbutton),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
