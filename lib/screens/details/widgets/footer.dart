import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  var clothes;
  Footer(clothes) {
    this.clothes = clothes;
  }
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'price',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                widget.clothes.price,
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, height: 1.5),
              )
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).primaryColor,
                ),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add to Cart',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
