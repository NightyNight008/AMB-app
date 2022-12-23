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
          //no idea wtf is this
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
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        homepageRoute, (route) => false);
                  },
                ),
                const Text('Back'),
              ],
            ),

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
              'Name:',
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
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  //**********************Maps button */
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            mapsroute, (route) => false);
                      },
                      icon: const Icon(Icons.map_rounded),
                      iconSize: 60,
                      tooltip: 'Maps',
                      splashColor: Colors.lightBlueAccent,
                      splashRadius: 60,
                    ),
                    const Text('Map'),
                  ],
                ),
                const SizedBox(
                  width: 25,
                ),
                //*************************book ambulance button */
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.app_registration),
                      iconSize: 60,
                      tooltip: 'Book Services',
                      splashColor: Colors.lightBlueAccent,
                      splashRadius: 60,
                    ),
                    const Text('Book Services'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            //*********************************Notification button */
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              iconSize: 60,
              tooltip: 'Notification',
              splashColor: Colors.lightBlueAccent,
              splashRadius: 60,
            ),
            const Text('Notification')
          ],
        ),
      ),
    );
  }

//*************************Stacking 2 pictures using Stack(idk how) */
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
