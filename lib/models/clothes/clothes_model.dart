import 'package:flutter/foundation.dart';

class Clothes extends ChangeNotifier {
  var title;
  var category;
  var price;
  var imgUrl;
  var detailUrl;
  var rating;
  var reviewCount;
  var description;
  var sizeList;

  Clothes(
      {title,
      category,
      price,
      imgUrl,
      detailUrl,
      double rating,
      String reviewCount,
      description,
      sizeList}) {
    this.title = title;
    this.category = category;
    this.price = price;
    this.imgUrl = imgUrl;
    this.detailUrl = detailUrl;
    this.rating = rating;
    this.reviewCount = reviewCount;
    this.description = description;
    this.sizeList = sizeList;
  }
}
