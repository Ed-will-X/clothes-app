import 'package:clothes_app/models/clothes/clothes_data.dart';
import 'package:clothes_app/screens/authentication/Authentication_root/authentication_root.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/user/user_data.dart';
import 'models/user/user_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClothesData>.value(
          value: ClothesData(),
        ),
        ChangeNotifierProvider<UserData>.value(
          value: UserData(),
        ),
        ChangeNotifierProvider<User>.value(
          value: User(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: Color(0xFFFAFAFA),
          primaryColor: Color(0xFFFFBD00),
          accentColor: Color(0xFFFFEBC7),
        ),
        // home: NavigationControl(),
        home: AuthenticationRoot(),
      ),
    );
  }
}
