import 'package:clothes_app/screens/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CartItems(),
          Footer(),
        ],
      ),
    );
  }
}

class CartItems extends StatefulWidget {
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 640,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return CartItem();
        },
      ),
    );
  }
}

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
      ),
      // margin: EdgeInsets.only(top: 50),
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
                '\$ 99.99',
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
                      'Proceed to Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.credit_card,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
