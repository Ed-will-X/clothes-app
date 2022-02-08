import 'package:flutter/material.dart';

class ClothesInfo extends StatefulWidget {
  var clothes;
  ClothesInfo(clothes) {
    this.clothes = clothes;
  }

  @override
  _ClothesInfoState createState() => _ClothesInfoState();
}

class _ClothesInfoState extends State<ClothesInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //////////////////   title
              Text(
                widget.clothes.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
              ),
            ],
          ),
          ////////////////////////  subtitle
          Text(
            ' ${widget.clothes.subtitle}',
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          //////////////////////  rating and review count
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Row(
              children: [
                Icon(
                  Icons.star_border,
                  color: Theme.of(context).primaryColor,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.clothes.rating.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      TextSpan(
                        text: ' (${widget.clothes.reviewCount})',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.clothes.description,
                  style: TextStyle(
                    color: Colors.grey.withOpacity(0.7),
                    height: 1.5,
                  ),
                ),
                TextSpan(
                  text: '  Read More',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
