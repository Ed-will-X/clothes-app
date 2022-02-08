import 'package:clothes_app/screens/authentication/signin/sign_in.dart';
import 'package:clothes_app/screens/authentication/signup/sign_up.dart';
import 'package:flutter/material.dart';

class AuthenticationRoot extends StatefulWidget {
  @override
  _AuthenticationRootState createState() => _AuthenticationRootState();
}

class _AuthenticationRootState extends State<AuthenticationRoot>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1,
    );

    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Image.asset(
                'icons/ecommerce.png',
                color: Theme.of(context).primaryColor,
                width: controller.value * 400,
                height: controller.value * 400,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Text(
                  'The Ultimate Clothing Store',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Text(
                  'Receive clothing items from the comfort of your home',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              /////////////////   OUTER BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Container(
                  padding: EdgeInsets.only(right: 25.0),
                  margin: EdgeInsets.symmetric(horizontal: 25.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      //////////////////  INNER BUTTON
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 55.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35),
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
