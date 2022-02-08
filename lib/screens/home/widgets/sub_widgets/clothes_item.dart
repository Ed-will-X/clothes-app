import 'package:clothes_app/screens/details/detail.dart';
import 'package:flutter/material.dart';

class ClothesItem extends StatefulWidget {
  var clothes;
  ClothesItem(clothes) {
    this.clothes = clothes;
  }

  @override
  _ClothesItemState createState() => _ClothesItemState();
}

class _ClothesItemState extends State<ClothesItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(widget.clothes)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(widget.clothes.imgUrl),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 15,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      child: Icon(Icons.favorite, color: Colors.red, size: 20),
                    ),
                  ),
                )
              ],
            ),
            Text(
              widget.clothes.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            Text(
              widget.clothes.subtitle,
              style: TextStyle(
                height: 1.5,
                color: Colors.grey,
              ),
            ),
            Text(
              widget.clothes.price,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
