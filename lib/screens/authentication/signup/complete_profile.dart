import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:clothes_app/screens/navigation_panel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_input.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.grey),
          automaticallyImplyLeading: false,
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;

  String firstname;
  String lastname;
  int phone;
  String address;

  FirebaseUser loggedInUser;

  bool firstNameError = false;
  bool lastNameError = false;
  bool phoneError = false;
  bool addressError = false;

  getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      loggedInUser = user;
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Complete Profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Enter your details',
                style: TextStyle(fontSize: 15, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ///////////////////////////   F.O.R.M.S   /////////////////
            Column(
              children: [
                CustomInput(
                  isError: firstNameError,
                  onChanged: (value) {
                    firstname = value;
                  },
                  icon: Icon(Icons.person_outline),
                  placeholder: 'Enter your first name',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isError: lastNameError,
                  onChanged: (value) {
                    lastname = value;
                  },
                  icon: Icon(Icons.person_outline),
                  placeholder: 'Enter your last name',
                ),
                SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isError: phoneError,
                  onChanged: (value) {
                    phone = int.parse(value);
                  },
                  icon: Icon(Icons.phone_android),
                  placeholder: 'Enter your phone number',
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomInput(
                  isError: addressError,
                  onChanged: (value) {
                    address = value;
                  },
                  icon: Icon(Icons.home_outlined),
                  placeholder: 'Enter your house address',
                ),
              ],
            ),
            SizedBox(height: 280),
            CustomButton(
              icon: Icons.supervised_user_circle_sharp,
              text: 'Register',
              onTap: () {
                Provider.of<UserData>(context, listen: false).completeProfile(
                  email: loggedInUser.email,
                  firstname: firstname,
                  lastname: lastname,
                  phone: phone,
                  houseAddress: address,
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavigationControl()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
