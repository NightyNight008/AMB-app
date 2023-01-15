// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../constant/routes.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final double coverHeight = 200;
  final double profileHeight = 128;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //************* */
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const SizedBox(
              height: 5,
            ),
            const Text(
              'About',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Name :',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ), //Pass the name parameter here??
            const Text(
              'Number:',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ), //Pass the number parameter here??
            const Text(
              'Address:',
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 50,
            ),

            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                homepageRoute, (route) => false);
                          },
                          child: const Text('Yes'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('No'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Logout'),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Contact Us'),
                ),
                const Text('|'),
                TextButton(
                  onPressed: () {},
                  child: const Text('About Us'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//*************************Stacking 2 pictures using Stack */
  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }
  //***********************Background image */

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: coverHeight,
        ),
      );

  //****************************************Profile Picture ?? */

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey[700],
        backgroundImage: const NetworkImage(
            'https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
      );
}
