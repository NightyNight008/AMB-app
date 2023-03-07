import 'package:amb_app/constant/routes.dart';
import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:amb_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../showerrordialog.dart';

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
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Center(
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
                        text_Field(texthint: 'Email', reference: _email),
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
                          height: 10,
                        ),
                        /******************************************/
                        Pressable_Button(
                          onTap: () async {
                            final email = _email.text;
                            final password = _password.text;
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              final user = FirebaseAuth.instance.currentUser;
                              if (user?.emailVerified ?? false) {
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  profilepageroute,
                                  (route) => false,
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                showErrorDialog(context, 'Unverified email');
                              }
                              // ignore: use_build_context_synchronously
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showErrorDialog(
                                    context, 'Wrong Email. or password');
                              } else if (e.code == 'wrong-password') {
                                showErrorDialog(
                                    context, 'Wrong Email or password.');
                              } else {
                                await showErrorDialog(
                                  context,
                                  'Error: ${e.code}',
                                );
                              }
                            } catch (e) {
                              await showErrorDialog(
                                context,
                                e.toString(),
                              );
                            }
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
              );
            default:
              return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
