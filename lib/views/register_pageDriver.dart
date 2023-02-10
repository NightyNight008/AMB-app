// ignore_for_file: file_names

import 'package:amb_app/custom%20widgets/text_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';
import '../custom widgets/pressable_buttons.dart';

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
                //*********************************************Full Name */
                text_Field(
                    texthint: 'Full Name',
                    reference:
                        _drivername), //reference is the controller,give controller value to reference.
                //**********************************************D.O.B */
                text_Field(
                    texthint: 'Date of Birth(DD-MM-YY)', reference: _dob),
                //**************************************************Permanent Address*/
                text_Field(
                    texthint: 'Permanent Address', reference: _peraddress),
                //***************************************Contact number */
                text_Field(texthint: 'Contact Number', reference: _contactno),
                //**********************************************************Current Adress */
                text_Field(
                    texthint: 'Current Address', reference: _currentaddress),
                const SizedBox(
                  height: 30,
                ),
                //**************************************************CitizenShip Number */
                const Text('CitizenShip Details'),
                text_Field(
                    texthint: 'CitizenShip Number', reference: _citizenshipno),
                //**************************************************CitizenShip Issue Date */
                text_Field(
                    texthint: 'Issue Date(DD-MM-YY)',
                    reference: _issuedatecitizenship),
                //*****************************************************Issued by */
                text_Field(
                    texthint: 'Issue by(District)', reference: _issuedistrict),
                const SizedBox(
                  height: 30,
                ),
                //************************Identification Card */
                const Text(
                    'Identification Cards(i.e VotersId/Driving license,etc)'),
                text_Field(
                    texthint: 'Identification Number', reference: _licenseno),
                //***************************************Issued by */
                text_Field(
                  texthint: 'Issue Date',
                  reference: _licenseissuedate,
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

                /***********************Register Button*******************/
                Pressable_Button(
                  onTap: () {
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
