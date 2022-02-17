import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../navigation_panel.dart';

class SignInSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 300,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(height: 250),
                Text(
                  'Login Success',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 70),
                CustomButton(
                  text: 'Go To Home',
                  icon: Icons.home_outlined,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigationControl()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
