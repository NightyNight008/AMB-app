// ignore_for_file: file_names

import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
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
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back_ios),
      //     onPressed: () {
      //       Navigator.of(context)
      //           .pushNamedAndRemoveUntil(homepageRoute, (route) => false);
      //     },
      //   ),
      // ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
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
                  children: [
                    IconButton(
                      onPressed: () {},
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
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.app_registration),
                      iconSize: 60,
                      tooltip: 'Book',
                      splashColor: Colors.lightBlueAccent,
                      splashRadius: 60,
                    ),
                    const Text('Book an Ambulance'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_960_720.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: coverHeight,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey[700],
        backgroundImage: const NetworkImage(
            'https://images.unsplash.com/photo-1628260412297-a3377e45006f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
      );
}


// ignore: camel_case_types
// class listtile_widget extends StatelessWidget {
//   const listtile_widget({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.onPress,
//     this.endIcon = true,
//   }) : super(key: key);
//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40,
//         height: 30,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(100),
//           color: Colors.blue,
//         ),
//         child: const Icon(Icons.medical_services_rounded),
//       ),
//       title: const Text(
//         'Book an Ambulance',
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//       trailing: endIcon
//           ? Container(
//               width: 40,
//               height: 30,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(100),
//                 color: Colors.blue,
//               ),
//               child: const Icon(Icons.navigate_next_rounded),
//             )
//           : null,
//     );
//   }
// }
