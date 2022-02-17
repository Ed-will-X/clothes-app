import 'package:clothes_app/models/clothes/clothes_data.dart';
import 'package:clothes_app/screens/products/new_arrival/widgets/category_tile.dart';
import 'package:clothes_app/screens/products/new_arrival/widgets/clothing_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularSalesPage extends StatefulWidget {
  @override
  _PopularSalesPageState createState() => _PopularSalesPageState();
}

class _PopularSalesPageState extends State<PopularSalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Popular Sales',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  int _selected = 1;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    var repo = Provider.of<ClothesData>(context, listen: true);

    List popularSalesArray = [];

    repo.filterProducts(repo.generatePopularSales(), popularSalesArray,
        repo.categories, widget._selected);

    print(repo.categories[widget._selected]);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          height: 40,
          child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CategoryTile(
                  category: repo.categories[index],
                  eventHandler: () {
                    setState(() {
                      widget._selected = index;
                    });
                  },
                  selected: widget._selected,
                  index: index,
                );
              }),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            childAspectRatio: 0.6,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 6.0,
            children: popularSalesArray.map<Widget>((item) {
              return GridTile(
                child: ClothingItem(cloth: item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
