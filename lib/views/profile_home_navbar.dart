import 'package:amb_app/views/profilePage.dart';
import 'package:amb_app/views/user_profileoptions.dart';
import 'package:flutter/material.dart';

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
    //  const Logout(),
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
        ],
      ),
    );
  }
}
