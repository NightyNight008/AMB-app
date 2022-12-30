import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/views/ProfilePage.dart';
import 'package:amb_app/views/user_options.dart';
import 'package:flutter/material.dart';
import '../custom widgets/cardbutton.dart';
import 'login_view.dart';

class ProfilePhome extends StatefulWidget {
  const ProfilePhome({super.key});

  @override
  State<ProfilePhome> createState() => _ProfilePhomeState();
}

class _ProfilePhomeState extends State<ProfilePhome> {
  int _currentIndex = 0;
  final screens = [
    const UserOptions(),
    const Center(child: Text('Notification', style: TextStyle(fontSize: 60))),
    const Profilepage(),
    const Center(child: Text('Logout', style: TextStyle(fontSize: 60))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => {_currentIndex = index}),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
            label: 'Notifications',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout,
              color: Colors.grey,
            ),
            label: 'Logout',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
// @override
// Widget @override
// Widget build(BuildContext context) => Scaffold(body: IndexedStack(children: screens,),)
// }