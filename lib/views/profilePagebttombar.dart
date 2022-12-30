// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class OptionsBar extends StatefulWidget {
//   const OptionsBar({super.key});

//   @override
//   State<OptionsBar> createState() => _OptionsBarState();
// }

// class _OptionsBarState extends State<OptionsBar> {
//   int currentIndex = 0;
//   final screens = [
//     const ProfilePhome(),
//     const Center(child: Text('Notification', style: TextStyle(fontSize: 60))),
//     const Profilepage(),
//     const Center(child: Text('Logout', style: TextStyle(fontSize: 60))),
//   ];
//   return 
// }

// @override
// Widget build(BuildContext context) => Scaffold(
//   body: IndexedStack(
//     index:currentIndex,
//     children: screens,),
//         bottomNavigationBar: BottomNavigationBar(
//         showUnselectedLabels: true,
//         currentIndex: currentIndex,
//         onTap: (index) => setState(() => currentIndex = index),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.home,
//               color: Colors.grey,
//             ),
//             label: 'Home',
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.notifications,
//               color: Colors.grey,
//             ),
//             label: 'Notifications',
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.person,
//               color: Colors.grey,
//             ),
//             label: 'Profile',
//             backgroundColor: Colors.blue,
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.logout,
//               color: Colors.grey,
//             ),
//             label: 'Logout',
//             backgroundColor: Colors.blue,
//           ),
//         ],
//       ),);
