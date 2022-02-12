import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ApprovalInfoPage extends StatelessWidget {
  int popCount = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Icon(
                  Icons.verified_user,
                  size: 300,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(height: 250),
                Text(
                  'Registration Success',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 70),
                CustomButton(
                  text: 'Go To User Page',
                  icon: Icons.person_outline,
                  onTap: () {
                    Navigator.of(context).popUntil((_) => popCount++ >= 2);
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
