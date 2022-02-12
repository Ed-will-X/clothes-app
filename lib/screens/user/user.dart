import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/user/merchant/become_meerchant_detail_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
              print("you're now a seller");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BecomeMerchantDetailForm()));
              // Provider.of<UserData>(context, listen: false).becomeSeller();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: Theme.of(context).primaryColor,
              child: Text("become a seller"),
            ),
          ),
        ],
      ),
    );
  }
}
