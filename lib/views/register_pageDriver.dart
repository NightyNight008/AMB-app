// ignore_for_file: file_names

import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';
import '../custom widgets/pressable_buttons.dart';
import '../showerrordialog.dart';

class RegisterDriver extends StatefulWidget {
  const RegisterDriver({Key? key}) : super(key: key);

  @override
  State<RegisterDriver> createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
  final _drivername = TextEditingController();
  final _dob = TextEditingController();
  final _peraddress = TextEditingController();
  final _contactno = TextEditingController();
  final _currentaddress = TextEditingController();
  final _citizenshipno = TextEditingController();
  final _issuedatecitizenship = TextEditingController();
  final _issuedistrict = TextEditingController();
  final _licenseno = TextEditingController();
  final _licenseissuedate = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final formkey = GlobalKey<FormState>();

  late DatabaseReference databaseReference;

  @override
  void initState() {
    super.initState();
    databaseReference = FirebaseDatabase.instance.ref().child('Driver');
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
                  //*********************************************Full Name */
                  TextFormField(
                    controller: _drivername,
                    decoration: const InputDecoration(labelText: 'Full Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fll this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //**********************************************D.O.B */
                  TextFormField(
                    controller: _dob,
                    decoration: const InputDecoration(
                        labelText: 'DOB in format dd/mm/year'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //**************************************************Permanent Address*/
                  TextFormField(
                    controller: _peraddress,
                    decoration:
                        const InputDecoration(labelText: 'Permanent Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fll this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //***************************************Contact number */
                  TextFormField(
                    controller: _contactno,
                    decoration:
                        const InputDecoration(labelText: 'Contact number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fll this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //**********************************************************Current Adress */
                  TextFormField(
                    controller: _currentaddress,
                    decoration:
                        const InputDecoration(labelText: 'Current Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fll this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //**************************************************CitizenShip Number */
                  const Text('CitizenShip Details'),
                  TextFormField(
                    controller: _citizenshipno,
                    decoration:
                        const InputDecoration(labelText: 'Citizenship no.'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //**************************************************CitizenShip Issue Date */
                  TextFormField(
                    controller: _issuedatecitizenship,
                    decoration: const InputDecoration(
                        labelText: 'Citizenship issue date'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //*****************************************************Issued by */
                  TextFormField(
                    controller: _issuedistrict,
                    decoration:
                        const InputDecoration(labelText: 'Issued District '),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //************************Identification Card */
                  const Text(
                      'Identification Cards(i.e VotersId/Driving license,etc)'),
                  TextFormField(
                    controller: _licenseno,
                    decoration: const InputDecoration(labelText: 'License no.'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  //***************************************Issued date license */
                  TextFormField(
                    controller: _licenseissuedate,
                    decoration:
                        const InputDecoration(labelText: 'License issue date'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //***************************email textfield*****************************
                  TextFormField(
                    controller: _email,
                    decoration:
                        const InputDecoration(labelText: 'Enter your email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
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
                    decoration:
                        const InputDecoration(labelText: 'Enter your Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please fill this field";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  /***********************Register Button*******************/
                  Pressable_Button(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final userCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );
                          final user = FirebaseAuth.instance.currentUser;
                          // ?. =elvis operator
                          // await user?.sendEmailVerification();

                          // devtools.log(userCredential.toString());
                          //email verify prompt
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Verify Email'),
                                content: const Text(
                                    'We will send email after data verification.Check you email to receive the email'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              homepageRoute, (route) => false);
                                    },
                                    child: const Text('Go to Homepage'),
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
                        Map<String, String> drivers = {
                          'Name': _drivername.text,
                          'DOB(d-m-y)': _dob.text,
                          'Permanent Address': _peraddress.text,
                          'Contact Number:': _contactno.text,
                          ' Current Address:': _currentaddress.text,
                          'Citizenship Number:': _citizenshipno.text,
                          ' CitizenShip Issue Date(d-m-y)':
                              _issuedatecitizenship.text,
                          ' CitizenShip Issue District': _issuedistrict.text,
                          'License No:': _licenseno.text,
                          'LicenseIssueDate(d-m-y)': _licenseissuedate.text,
                          'Email:': _email.text,
                        };
                        databaseReference.push().set(drivers);
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
