import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
      padding: EdgeInsets.only(top: 50, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                  // color: Colors.red,
                  ),
              width: 60,
              height: 40,
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
          Text(
            'Cart',
            style: TextStyle(fontSize: 20),
          ),
          GestureDetector(
            child: Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
