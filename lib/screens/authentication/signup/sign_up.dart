import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/authentication/signup/complete_profile.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_input.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          'Sign Up',
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
  String email;
  String password;
  String passwordConfirmation = '123456';

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Register Account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Sign Up with your email and password \nor continue with google',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ///////////////////////   I.N.P.U.T.S   /////////////////////////
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                      onChanged: (value) {
                        email = value;
                      },
                      icon: Icon(Icons.mail_outline_outlined),
                      placeholder: 'Enter your Email',
                    ),
                    CustomInput(
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: true,
                      icon: Icon(Icons.lock_outlined),
                      placeholder: 'Enter Your Password',
                    ),
                    CustomInput(
                      onChanged: (value) {
                        passwordConfirmation = value;
                      },
                      icon: Icon(Icons.lock_outlined),
                      obscureText: true,
                      placeholder: 'Re-enter Your Password',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 280),
              CustomButton(
                icon: Icons.supervised_user_circle_sharp,
                text: 'Continue',
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  try {
                    final newUser =
                        await Provider.of<UserData>(context, listen: false)
                            .signUp(email, password);

                    if (newUser != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompleteProfile()));
                    }
                  } catch (e) {
                    print(e);
                  }

                  setState(() {
                    showSpinner = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
