import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool _isSelected = true;
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //////////////////////    CHECKBOX
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              checkColor: Colors.white,
              activeColor: Theme.of(context).primaryColor,
              value: _isSelected,
              onChanged: (bool value) {
                setState(() {
                  _isSelected = value;
                });
              },
            ),
          ),
          //////////////////// IMAGE
          Container(
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/best1.png'),
            ),
          ),
          ////////////////// DETAILS
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Yellow Jacket',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Jackets',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              Text(
                '\$' + '99.99',
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 15),
              ),
            ],
          ),
          //////////////////// QUANTITY CONTROL
          Row(
            children: [
              NeumorphicButton(
                text: '-',
                onTap: () {
                  setState(() {
                    if (_quantity > 0) {
                      _quantity = _quantity - 1;
                      print(_quantity);

                      if (_quantity == 0) {
                        _isSelected = false;
                        print(_quantity);
                      }
                    }
                  });
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  _quantity.toString(),
                ),
              ),
              NeumorphicButton(
                  text: '+',
                  onTap: () {
                    setState(() {
                      _isSelected = true;
                      _quantity++;
                      print(_quantity);
                    });
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class NeumorphicButton extends StatefulWidget {
  String text;
  Function onTap;
  NeumorphicButton({text, onTap}) {
    this.text = text;
    this.onTap = onTap;
  }

  @override
  _NeumorphicButtonState createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Center(
        child: Container(
          width: 30,
          height: 30,
          child:
              Center(child: Text(widget.text, style: TextStyle(fontSize: 20))),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                offset: Offset(1.0, 1.0),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-1.0, -1.0),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
