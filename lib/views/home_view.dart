import 'package:flutter/material.dart';

import '../constant/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 253),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Press the buttons as per your need"),
              const SizedBox(
                height: 25,
              ),
              // *******************************************************Emergency button
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                child: const Text("Emergency"),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 0, 255, 26),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //*************************************************Life threatening  */
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                },
                child: const Text("Life Threatening emergency"),
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 0, 0),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),

              //*****************************************************/
              const SizedBox(
                height: 100,
              ),
              //*****************************Login Button On Homepage */

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          login2Route, (route) => false);
                    },
                    child: const Text("Login"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  //****************************8Register Button */
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          registerRoute, (route) => false);
                    },
                    child: const Text("Register"),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                    ),
                  ),
                  //**********************************************************************/
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}










//*****************************************************************
//*****************************************************************
    //  *******************************************************
              // const SizedBox(
              //   height: 10,
              // ),
              // ***************************************************************************

//*************************************************************************************** */
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         Navigator.of(context).pushNamedAndRemoveUntil(
              //             login2Route, (route) => false);
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.all(18.0),
              //         decoration: const BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: Colors.blue,
              //         ),
              //         child: const Center(
              //           child: Text(
              //             "Login",
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontWeight: FontWeight.bold,
              //               fontSize: 18,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              //********************************************************************************** */
      
      // floatingActionButton: FabCircularMenu(
      //   fabOpenColor: const Color.fromARGB(255, 59, 255, 216),
      //   fabCloseColor: Colors.white,
      //   ringColor: const Color.fromARGB(255, 59, 206, 255),
      //   alignment: Alignment.bottomCenter,
      //   ringDiameter: 300,
      //   children: [
      //     // InkWell(
      //     //     child: const Text(    can also use icons instead
      //     //       'Register',
      //     //       style: TextStyle(
      //     //           color: Colors.blue,
      //     //           fontWeight: FontWeight.bold,
      //     //           fontSize: 18),
      //     //     ),
      //     InkWell(
      //         child: const Text(
      //           'Register',
      //           style: TextStyle(
      //               color: Colors.blue,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 18),
      //         ),
      //         onTap: () {
      //           Navigator.of(context).pushReplacement(
      //             MaterialPageRoute(
      //               builder: (BuildContext context) => const RegisterPage(),
      //             ),
      //           );
      //         }),
      //     InkWell(
      //         child: const Text(
      //           'Login',
      //           style: TextStyle(
      //               color: Colors.blue,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 18),
      //         ),
      //         onTap: () {
      //           Navigator.of(context).pushReplacement(
      //             MaterialPageRoute(
      //               builder: (BuildContext context) => const LoginPage(),
      //             ),
      //           );
      //         }),
      //   ],
      // ),

