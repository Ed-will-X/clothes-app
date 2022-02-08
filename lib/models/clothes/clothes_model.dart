class Clothes {
  var title;
  var subtitle;
  var price;
  var imgUrl;
  var detailUrl;
  var rating;
  var reviewCount;
  var description;
  var sizeList;

  Clothes(
      {title,
      subtitle,
      price,
      imgUrl,
      detailUrl,
      double rating,
      String reviewCount,
      description,
      sizeList}) {
    this.title = title;
    this.subtitle = subtitle;
    this.price = price;
    this.imgUrl = imgUrl;
    this.detailUrl = detailUrl;
    this.rating = rating;
    this.reviewCount = reviewCount;
    this.description = description;
    this.sizeList = sizeList;
  }
}
