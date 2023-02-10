// ignore_for_file: file_names

import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: const Text('Register'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(register2Route, (route) => false);
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
                  "Register Here",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                //***************************email textfield*****************************
                //Reference means controller,and value given to them are just to prevent erros,give proper values to it.
                text_Field(
                  texthint: 'Email',
                  reference: _email,
                ),
                const SizedBox(
                  height: 5,
                ),
                //*******************************Contact Info */
                text_Field(
                  texthint: 'Contact Address',
                  reference: _email,
                ),
                const SizedBox(
                  height: 5,
                ),
                //***************************password text field**************************************
                text_Field(
                  reference: _password,
                  texthint: 'Password',
                  obscure_text: true,
                ),
                const SizedBox(
                  height: 5,
                ),
                text_Field(
                  reference: _password,
                  texthint: 'Re-enter Password',
                  obscure_text: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                /******************************************/
                Pressable_Button(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                  },
                  buttontext: 'Register',
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
                    const Text('Already Registered ?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            loginRoute, (route) => false);
                      },
                      child: const Text("Login Here"),
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
