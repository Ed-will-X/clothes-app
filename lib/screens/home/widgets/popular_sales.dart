import 'package:clothes_app/models/clothes/clothes_data.dart';
import 'package:clothes_app/screens/home/widgets/sub_widgets/categories_link.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularSales extends StatefulWidget {
  @override
  _PopularSalesState createState() => _PopularSalesState();
}

class _PopularSalesState extends State<PopularSales> {
  @override
  Widget build(BuildContext context) {
    var clothes = Provider.of<ClothesData>(context).generatePopularSales();

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesLink(title: 'Popular Sales'),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/images/best1.png'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clothes[1].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            clothes[1].subtitle,
                            style: TextStyle(
                              color: Colors.grey,
                              height: 1.5,
                            ),
                          ),
                          Text(
                            clothes[1].price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
