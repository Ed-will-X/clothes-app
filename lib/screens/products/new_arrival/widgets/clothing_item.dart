import 'package:clothes_app/screens/details/detail.dart';
import 'package:flutter/material.dart';

class ClothingItem extends StatefulWidget {
  @override
  _ClothingItemState createState() => _ClothingItemState();

  var cloth;

  ClothingItem({@required this.cloth});
}

class _ClothingItemState extends State<ClothingItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(widget.cloth),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    // color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(widget.cloth.imgUrl),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  height: 190,
                ),
                Positioned(
                  top: 15,
                  right: 10,
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
              widget.cloth.title.length < 15
                  ? widget.cloth.title
                  : '${widget.cloth.title.substring(0, 15)} ...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            ),
            Text(
              widget.cloth.category,
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
            Text(
              widget.cloth.price.toString(),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                height: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
