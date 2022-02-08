import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  var tagsList = ['woman', 'T-shirt', 'dress'];
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  get tagsList => widget.tagsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: TextField(
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'search Aesthetic Shirt',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/icons/filter.png',
                  width: 25,
                ),
              ),
            ],
          ),
          Row(
            children: tagsList
                .map<Widget>(
                  (tag) => Container(
                    margin: EdgeInsets.only(top: 10, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
