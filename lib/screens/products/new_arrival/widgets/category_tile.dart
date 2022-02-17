import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  String category;
  int selected;
  Function eventHandler;
  int index;

  CategoryTile({this.category, this.selected, this.eventHandler, this.index});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.eventHandler,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 25),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: widget.selected == widget.index
              ? Theme.of(context).accentColor
              : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
        ),
        child: Center(
          child: Text(widget.category),
        ),
      ),
    );
  }
}
