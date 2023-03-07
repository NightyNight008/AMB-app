import 'package:amb_app/custom%20widgets/pressable_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';
import '../showerrordialog.dart';

class testview extends StatefulWidget {
  @override
  testviewState createState() {
    return testviewState();
  }
}

class testviewState extends State<testview> {
  final formkey = GlobalKey<FormState>();
  String name = "";
  late final TextEditingController _emailuser;
  late final TextEditingController _password;
  // late final _password = TextEditingController();
  late final _username = TextEditingController();
  late final _contactnouser = TextEditingController();
  late DatabaseReference dbref;
  final _formkey = GlobalKey<FormState>();

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
    // final double height = MediaQuery.of(context).size.height;
    // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Error Showed if Field is Empty on Submit button Pressed'),
              TextFormField(
                controller: _contactnouser,
                decoration: InputDecoration(labelText: 'Enter your name'),
                validator: (value) {
                  if (value!.isEmpty
                      // RegExp(r'^[a-z A-Z]+$').hasMatch(value)
                      ) {
                    return "please enter correct email";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _emailuser,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Enter your email'),
                validator: (value) {
                  if (value!.isEmpty
                      // RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}'
                      // )
                      //     .hasMatch(value)
                      ) {
                    return "please enter correct email";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                controller: _password,
                decoration: InputDecoration(labelText: 'Enter your number'),
                validator: (value) {
                  if (value!.isEmpty
                      // RegExp(r'^[0-9]+$').hasMatch(value
                      ) {
                    return "please enter correct email";
                  } else {
                    return null;
                  }
                },
              ),
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
                  buttontext: 'test')
            ],
          ),
        ),
      ),
    );
  }
}
