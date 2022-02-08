import 'package:clothes_app/utilities/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'clothes_model.dart';

class ClothesData extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  String title;
  String gender;
  List colors;
  String clothingType;
  int price;
  String coverImage;
  List images;
  List sizeList;
  String description;

  double rating;
  List reviews;
  List sales;
  String dateAdded;
  String seller;

  createProduct(
      {title,
      gender,
      clothingType,
      colors,
      price,
      coverImage,
      images,
      sizeList,
      description}) {
    try {
      _firestore.collection('clothes').add({
        'title': title,
        'gender': gender,
        'clothing-type': clothingType,
        'colors': colors,
        'price': price,
        'image': coverImage,
        'images': images,
        'size-list': sizeList,
        'description': description,
        'rating': rating,
        'reviews': reviews,
        'sales': sales,
        'date-added': dateAdded,
        'seller': seller,
        'id': randomId(10, 'products'),
      });
    } catch (e) {
      print(e);
    }
  }

  List<Clothes> generateNewArrival() {
    return [
      Clothes(
          title: 'Gucci Oversized Hoodie',
          subtitle: 'Hoodie',
          price: '\$79.99',
          rating: 4.5,
          reviewCount: '2.5k',
          imgUrl: 'assets/images/arrival1.png',
          sizeList: ['M', 'L', 'XL', 'XXL'],
          detailUrl: [
            'assets/images/arrival1.png',
            'assets/images/detail2.png'
          ],
          description:
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit'),
      Clothes(
        title: "men's coat",
        subtitle: 'Rain-Jacket',
        price: "\$39.99",
        rating: 5.0,
        reviewCount: '1.5k',
        imgUrl: 'assets/images/arrival2.png',
        sizeList: ['M', 'L', 'XL', 'XXL'],
        detailUrl: ['assets/images/arrival2.png', 'assets/images/detail3.png'],
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit',
      ),
      Clothes(
        title: "Yellow Jacket",
        subtitle: 'Jackets',
        price: "\$99.99",
        rating: 4.9,
        reviewCount: '1.7k',
        sizeList: ['S', 'M', 'L', 'XL', 'XXL'],
        imgUrl: 'assets/images/detail3.png',
        detailUrl: [
          'assets/images/detail3.png',
          'assets/images/arrival1.png',
          'assets/images/arrival2.png',
          'assets/images/detail3.png'
        ],
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit',
      ),
    ];
  }

  List<Clothes> generatePopularSales() {
    return [
      Clothes(
        title: "Yellow Jacket",
        subtitle: 'Jackets',
        price: "\$99.99",
        rating: 4.5,
        reviewCount: '2.2k',
        imgUrl: 'assets/images/detail3.png',
        sizeList: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        detailUrl: ['assets/images/detail3.png', 'assets/images/detail3.png'],
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit',
      ),
      Clothes(
        title: "Yellow Jacket",
        subtitle: 'Jackets',
        price: "\$99.99",
        rating: 4.3,
        reviewCount: '1.2k',
        imgUrl: 'assets/images/detail3.png',
        sizeList: ['XS', 'S', 'M', 'L', 'XL', 'XXL'],
        detailUrl: ['assets/images/detail3.png', 'assets/images/detail3.png'],
        description:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit',
      ),
    ];
  }
}
