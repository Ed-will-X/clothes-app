import 'package:clothes_app/models/clothes/clothes_data.dart';
import 'package:clothes_app/screens/home/widgets/sub_widgets/categories_link.dart';
import 'package:clothes_app/screens/home/widgets/sub_widgets/clothes_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewArrival extends StatefulWidget {
  @override
  _NewArrivalState createState() => _NewArrivalState();
}

class _NewArrivalState extends State<NewArrival> {
  @override
  Widget build(BuildContext context) {
    var clothesList = Provider.of<ClothesData>(context).generateNewArrival();
    return Column(
      children: [
        CategoriesLink(title: 'New Arrival'),
        Container(
          height: 280,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 25),
            itemBuilder: (context, index) => ClothesItem(clothesList[index]),
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemCount: clothesList.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
