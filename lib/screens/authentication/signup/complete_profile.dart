import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/models/user/user_model.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:clothes_app/screens/navigation_panel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
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

  List<String> genders = ['male', 'female', 'other'];

  String firstname;
  String lastname;
  int phone;
  String address;
  String gender;
  String DOB;

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

  _pushDatePicker() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.only(top: 20),
          margin: EdgeInsets.only(top: 500),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            children: [
              Text(
                'Choose a BirthDate',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2000, 1, 1),
                  onDateTimeChanged: (newDate) {
                    setState(() {
                      // var dateTime = DateTime.parse(newDate);
                      DOB = '${newDate.day}-${newDate.month}-${newDate.year}';
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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
              height: 10,
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
                CustomInput(
                  isError: lastNameError,
                  onChanged: (value) {
                    lastname = value;
                  },
                  icon: Icon(Icons.person_outline),
                  placeholder: 'Enter your last name',
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
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Color(0xFFF5F8FD),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: DropdownButtonFormField<String>(
                value: gender,
                hint: Text(
                  'Select gender',
                ),
                isExpanded: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                onSaved: (value) {
                  setState(() {
                    gender = value;
                  });
                },
                validator: (String value) {
                  if (value.isEmpty) {
                    return "can't be empty";
                  } else {
                    return null;
                  }
                },
                items: Provider.of<User>(context, listen: false)
                    .genders
                    .map((String val) {
                  return DropdownMenuItem(
                    value: val,
                    child: Text(
                      val,
                    ),
                  );
                }).toList(),
              ),
            ),

            GestureDetector(
              onTap: () {
                _pushDatePicker();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F8FD),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tap to select date of birth',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.black.withOpacity(0.6),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
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
                  gender: gender,
                  DOB: DOB,
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
