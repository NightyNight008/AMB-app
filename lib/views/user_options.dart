import 'package:flutter/material.dart';
import '../constant/routes.dart';
import '../custom widgets/cardbutton.dart';

class UserOptions extends StatefulWidget {
  const UserOptions({super.key});

  @override
  State<UserOptions> createState() => _UserOptionsState();
}

class _UserOptionsState extends State<UserOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(homepageRoute, (route) => false);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardButton(
                tap: () {},
                text: 'Book an Ambulance',
                details:
                    'If you or any of your loved ones are in the need of Medical services.You can request for our services,on the day and time of your wish.',
                link: 'assets/images/Ambulance1.jpg',
                pressbutton: 'Request',
              ),
              CardButton(
                tap: () {},
                text: 'Find Now',
                details:
                    'You can locate nearby ambulances and hospitals close to you',
                link: 'assets/images/Maps.jpg',
                pressbutton: 'Find Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
