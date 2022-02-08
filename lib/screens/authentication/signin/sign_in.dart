import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/authentication/signin/sign_in_success.dart';
import 'package:clothes_app/screens/authentication/signup/sign_up.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_input.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
          'Sign In',
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
                'Welcome Back',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Sign in with your email and password \nor sign in with google',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  CustomInput(
                    onChanged: (value) {
                      email = value;
                    },
                    icon: Icon(Icons.mail_outline_outlined),
                    placeholder: 'Enter your Email',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomInput(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    icon: Icon(Icons.lock_outlined),
                    placeholder: 'Enter Your Password',
                  ),
                ],
              ),
              SizedBox(height: 300),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: Row(
                  children: [
                    Text("Don't have an account?"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Register',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                icon: Icons.verified_user,
                text: 'Sign In',
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  final user =
                      await Provider.of<UserData>(context, listen: false)
                          .signIn(email, password);
                  if (user != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInSuccess()));
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
