import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/custom%20widgets/Text_field.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

// ignore_for_file: file_names
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //late means value will be assigned later
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(homepageRoute, (route) => false);
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //******************************************************************** */
                const Icon(Icons.medical_services, size: 100),
                const Text(
                  "Hi,",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                //********************************************************************* */
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //***************************email textfield*****************************
                text_Field(texthint: 'Email'),
                const SizedBox(
                  height: 5,
                ),
                //***************************password text field**************************************
                text_Field(
                  texthint: 'Email',
                  obscure_text: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                /******************************************/
                Pressable_Button(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        profilepageroute, (route) => false);
                  },
                  buttontext: 'Login',
                  horizontalLength: 80,
                  verticallength: 22,
                ),
                const SizedBox(
                  height: 10,
                ),
                /*********************************************/

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Registered yet?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            register2Route, (route) => false);
                      },
                      child: const Text("Register Here"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
