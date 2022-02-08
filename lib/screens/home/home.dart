import 'package:clothes_app/screens/home/widgets/custom_app_bar.dart';
import 'package:clothes_app/screens/home/widgets/new_arrival.dart';
import 'package:clothes_app/screens/home/widgets/popular_sales.dart';
import 'package:clothes_app/screens/home/widgets/search_input.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        SearchInput(),
        NewArrival(),
        PopularSales(),
      ],
    );
  }
}
