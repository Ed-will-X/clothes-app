import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/models/user/user_model.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Body(),
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
  String firstnameInitial = 'initial value';

  // TextEditingController firstnameController =
  //     TextEditingController(text: 'initial value');
  // TextEditingController lastnameController =
  //     TextEditingController(text: 'initial value');
  // TextEditingController phoneController =
  //     TextEditingController(text: 'initial value');
  // TextEditingController addressController =
  //     TextEditingController(text: 'initial value');
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

  _pushDatePicker(DateTime initialDate) {
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
                'Edit BirthDate',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: initialDate,
                  onDateTimeChanged: (newDate) {
                    setState(() {
                      // var dateTime = DateTime.parse(newDate);
                      DOB = '${newDate.year}-${newDate.month}-${newDate.day}';
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
    print(Provider.of<UserData>(context).DOB);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Edit Profile',
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
                  controller: TextEditingController(
                      text: Provider.of<UserData>(context).firstname != null
                          ? Provider.of<UserData>(context).firstname
                          : ''),
                  icon: Icon(Icons.person_outline),
                  placeholder: 'Enter your first name',
                ),
                CustomInput(
                  isError: lastNameError,
                  controller: TextEditingController(
                      text: Provider.of<UserData>(context).lastname != null
                          ? Provider.of<UserData>(context).lastname
                          : ''),
                  icon: Icon(Icons.person_outline),
                  placeholder: 'Enter your last name',
                ),
                CustomInput(
                  isError: phoneError,
                  controller: TextEditingController(
                      text: Provider.of<UserData>(context).phone != null
                          ? Provider.of<UserData>(context).phone.toString()
                          : ''),
                  icon: Icon(Icons.phone_android),
                  placeholder: 'Enter your phone number',
                  keyboardType: TextInputType.number,
                ),
                CustomInput(
                  isError: addressError,
                  controller: TextEditingController(
                      text: Provider.of<UserData>(context).houseAddress != null
                          ? Provider.of<UserData>(context).houseAddress
                          : ''),
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
                _pushDatePicker(DateTime.parse(
                    Provider.of<UserData>(context, listen: false).DOB));
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
                      'Tap to edit date of birth',
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
              // onTap: () {
              //   Provider.of<UserData>(context, listen: false).completeProfile(
              //     email: loggedInUser.email,
              //     firstname: firstname,
              //     lastname: lastname,
              //     phone: phone,
              //     houseAddress: address,
              //     gender: gender,
              //     DOB: DOB,
              //   );
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => NavigationControl()));
              // },
            ),
          ],
        ),
      ),
    );
  }
}
