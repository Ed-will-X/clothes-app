import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_button.dart';
import 'package:clothes_app/screens/authentication/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import 'approval_info_page.dart';

class BecomeMerchantDetailForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Colors.grey),
        automaticallyImplyLeading: true,
        title: Text(
          'Become A Merchant',
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
  String companyName;
  String companyAddress;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              'Become A Merchant',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Enter additional details to \nbecome a merchant',
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
                      companyName = value;
                    },
                    icon: Icon(Icons.verified_user),
                    placeholder: 'Enter Company Name',
                  ),
                  CustomInput(
                    onChanged: (value) {
                      companyAddress = value;
                    },
                    icon: Icon(Icons.home),
                    placeholder: 'Enter Company Address',
                  ),
                ],
              ),
            ),
            SizedBox(height: 280),
            CustomButton(
              icon: Icons.verified_user,
              text: 'Continue',
              onTap: () async {
                setState(() {
                  showSpinner = true;
                });

                try {
                  await Provider.of<UserData>(context, listen: false)
                      .becomeMerchant(
                          companyName: companyName,
                          companyAddress: companyAddress);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ApprovalInfoPage()));
                } catch (error) {
                  print(error);
                }

                setState(() {
                  showSpinner = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
