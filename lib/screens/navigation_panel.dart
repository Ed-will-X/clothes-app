import 'package:clothes_app/screens/user/user.dart';
import 'package:flutter/material.dart';

import 'home/home.dart';

class NavigationControl extends StatefulWidget {
  @override
  _NavigationControlState createState() => _NavigationControlState();
}

class _NavigationControlState extends State<NavigationControl> {
  int currentIndex = 0;
  var items = [
    Home(),
    Container(child: Center(child: Text('Categories'))),
    Container(child: Center(child: Text('Likes'))),
    User(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: items[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.category_outlined),
            ),
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.favorite_outline),
            ),
            BottomNavigationBarItem(
              label: 'home',
              icon: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
    );
  }
}
