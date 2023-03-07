// ignore_for_file: file_names

import 'dart:math';

import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';
import '../showerrordialog.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //late means value will be assigned later
  late final TextEditingController _emailuser;
  late final TextEditingController _password;
  // late final _password = TextEditingController();
  late final _username = TextEditingController();
  late final _contactnouser = TextEditingController();
  late DatabaseReference dbref;
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    dbref = FirebaseDatabase.instance.ref().child('User');
    _emailuser = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _emailuser.dispose();
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
      body: Form(
        key: formkey,
        child: Center(
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
                  TextFormField(
                    controller: _emailuser,
                    decoration:
                        const InputDecoration(labelText: 'Enter your email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "please enter correct email";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // TextField(
                  //   controller: _emailuser,
                  //   obscureText: false,
                  //   decoration: InputDecoration(
                  //     border: InputBorder.none,
                  //     hintText: 'Email',
                  //     errorText: _validate ? 'Can\'t be empty' : null,
                  //   ),
                  // ),
                  //************************************Name*/
                  TextFormField(
                    controller: _username,
                    decoration:
                        const InputDecoration(labelText: 'Enter your Name'),
                    validator: (value) {
                      if (value!.isEmpty
                          // RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}'
                          // )
                          //     .hasMatch(value)
                          ) {
                        return "Please fill the field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  //*******************************Contact Info */
                  TextFormField(
                    controller: _contactnouser,
                    decoration:
                        const InputDecoration(labelText: 'Enter your Contact'),
                    validator: (value) {
                      if (value!.isEmpty
                          // RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}'
                          // )
                          //     .hasMatch(value)
                          ) {
                        return "Please fill the field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //***************************password text field**************************************
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Enter your Password'),
                    validator: (value) {
                      if (value!.isEmpty
                          // RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}'
                          // )
                          //     .hasMatch(value)
                          ) {
                        return "Please fill the field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  /******************************************/
                  Pressable_Button(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        final snackBar =
                            SnackBar(content: Text('Submitting Form'));
                        // _scaffoldKey.currentState!.showSnackBar(snackBar);
                        final email = _emailuser.text;
                        final password = _password.text;
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          final user = FirebaseAuth.instance.currentUser;
                          // ?. =elvis operator
                          user?.sendEmailVerification();
                          // devtools.log(userCredential.toString());
                          //show verify eail prompt
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Verify Email'),
                                content: const Text(
                                    'Check you email for verification'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              loginRoute, (route) => false);
                                    },
                                    child: const Text('Go to login'),
                                  )
                                ],
                              );
                            },
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showErrorDialog(
                              context,
                              'Weak Password',
                            );
                          } else if (e.code == 'email-already-in-use') {
                            showErrorDialog(context, "Email Already in use");
                          } else if (e.code == 'invalid-email') {
                            showErrorDialog(context, 'Invalid Email');
                          } else {
                            showErrorDialog(
                              context,
                              'Something has gone wrong',
                              //${e.code}',
                            );
                          }
                        } catch (e) {
                          await showErrorDialog(
                            context,
                            e.toString(),
                          );
                        }
                        Map<String, String> users = {
                          'Name': _username.text,
                          'Contact Number:': _contactnouser.text,
                          'Email:': _emailuser.text,
                        };
                        dbref.push().set(users);
                      }
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
      ),
    );
  }
}
