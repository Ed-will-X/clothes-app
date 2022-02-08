import 'package:flutter/material.dart';

class SizeList extends StatefulWidget {
  var clothes;
  SizeList(clothes) {
    this.clothes = clothes;
  }
  @override
  _SizeListState createState() => _SizeListState();
}

class _SizeListState extends State<SizeList> {
  var _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              _selected = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: _selected == index
                  ? Theme.of(context).accentColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey.withOpacity(0.1),
                width: 2,
              ),
            ),
            child: Text(
              widget.clothes.sizeList[index],
              style: TextStyle(
                color: _selected == index
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        itemCount: widget.clothes.sizeList.length,
      ),
    );
  }
}
