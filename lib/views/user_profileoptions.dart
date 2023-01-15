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
              const SizedBox(
                height: 10,
              ),
              CardButton(
                  tap: () {},
                  text: 'For Normal Cases',
                  details:
                      "In case of minor injury and other medical help press this button.In case of minor injury and other medical help press this button.In case of minor injury and other medical help press this button.In case of minor injury and other medical help press this button.",
                  link: "assets/images/injured.jpg",
                  pressbutton: 'Request'),

              //*************************************************Life threatening  */
              const SizedBox(
                height: 10,
              ),
              CardButton(
                tap: () {},
                text: 'For emergency cases',
                details:
                    "In case of life threatening incidents,press this button.In case of life threatening incidents,press this buttonIn case of life threatening incidents,press this buttonIn case of life threatening incidents,press this buttonIn case of life threatening incidents,press this button",
                link: "assets/images/icu.jpg",
                pressbutton: 'Request',
              ),
              const SizedBox(
                height: 10,
              ),
              CardButton(
                tap: () {},
                text: 'Find Now',
                details:
                    'You can locate nearby ambulances and hospitals close to you',
                link: 'assets/images/maps_1.jpg',
                pressbutton: 'Find Now',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
