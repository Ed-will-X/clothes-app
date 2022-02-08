import 'package:clothes_app/screens/details/widgets/clothes_info.dart';
import 'package:clothes_app/screens/details/widgets/detail_slider.dart';
import 'package:clothes_app/screens/details/widgets/footer.dart';
import 'package:clothes_app/screens/details/widgets/size_list.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  var clothes;
  DetailPage(clothes) {
    this.clothes = clothes;
  }

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailSlider(widget.clothes),
            ClothesInfo(widget.clothes),
            SizeList(widget.clothes),
            Footer(widget.clothes)
          ],
        ),
      ),
    );
  }
}
