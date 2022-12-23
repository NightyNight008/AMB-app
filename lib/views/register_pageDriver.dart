// ignore_for_file: file_names

import 'package:amb_app/custom%20widgets/Text_field.dart';
import 'package:flutter/material.dart';

import '../constant/routes.dart';
import '../custom widgets/pressable_buttons.dart';

class RegisterDriver extends StatefulWidget {
  const RegisterDriver({Key? key}) : super(key: key);

  @override
  State<RegisterDriver> createState() => _RegisterDriverState();
}

class _RegisterDriverState extends State<RegisterDriver> {
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
                text_Field(texthint: 'Full Name'),
                //**********************************************D.O.B */
                text_Field(texthint: 'Date of Birth(DD-MM-YY)'),
                //**************************************************Permanent Address*/
                text_Field(texthint: 'Permanent Address'),
                //***************************************Contact number */
                text_Field(texthint: 'Contact Number'),
                //**********************************************************Current Adress */
                text_Field(texthint: 'Current Address'),
                const SizedBox(
                  height: 30,
                ),
                //**************************************************CitizenShip Number */
                const Text('CitizenShip Details'),
                text_Field(texthint: 'CitizenShip Number'),
                //**************************************************CitizenShip Issue Date */
                text_Field(texthint: 'Issue Date(DD-MM-YY)'),
                //*****************************************************Issued by */
                text_Field(texthint: 'Issue by(District)'),
                const SizedBox(
                  height: 30,
                ),
                //********************************************Passport */
                const Text('Passport Details'),
                text_Field(texthint: 'Pasport Number'),
                //**************************************************CitizenShip Issue Date */
                text_Field(texthint: 'Issue Date(DD-MM-YY)'),
                //*****************************************************Issued by */
                text_Field(texthint: 'Issue by(District)'),
                const SizedBox(
                  height: 30,
                ),
                //************************Identification Card */
                const Text(
                    'Identification Cards(i.e VotersId/Driving license,etc)'),
                text_Field(texthint: 'Identification Number'),
                //***************************************Issued by */
                text_Field(texthint: 'Issue Date'),
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
                  texthint: 'Password',
                  obscure_text: true,
                ),
                text_Field(
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
