import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/user/user_related/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'merchant/become_meerchant_detail_form.dart';

class User extends StatefulWidget {
  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print('logged out');
                  Provider.of<UserData>(context, listen: false).signOut();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  color: Theme.of(context).primaryColor,
                  child: Text('Logout'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("you're now a merchant");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BecomeMerchantDetailForm()));
                  // Provider.of<UserData>(context, listen: false).becomeSeller();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  color: Theme.of(context).primaryColor,
                  child: Text("become a merchant"),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });

                  await Provider.of<UserData>(context, listen: false)
                      .getUserDetails();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditProfile()));
                  setState(() {
                    showSpinner = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  color: Theme.of(context).primaryColor,
                  child: Text("Edit profile"),
                ),
              ),
              Container(
                child: Text(
                    'Merchant Status: ${Provider.of<UserData>(context).isMerchant}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
