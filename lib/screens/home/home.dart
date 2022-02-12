import 'package:clothes_app/models/user/user_data.dart';
import 'package:clothes_app/screens/home/widgets/custom_app_bar.dart';
import 'package:clothes_app/screens/home/widgets/new_arrival.dart';
import 'package:clothes_app/screens/home/widgets/popular_sales.dart';
import 'package:clothes_app/screens/home/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserData>(context, listen: false).firstname);
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
