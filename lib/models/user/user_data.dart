import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  String email;
  String password;
  String firstname;
  String lastname;
  int phone;
  String houseAddress;
  String gender;
  List cart;
  List pendingOrders;
  List favorites;
  bool isSeller = false;
  List advertisedProducts;
  String companyAddress;
  String joinDate;
  String userID;

  signUp(email, password) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // email = newUser.email;

      return newUser;
    } catch (e) {
      print(e);
    }
  }

  signIn(email, password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      this.email = email;

      return user;
    } catch (e) {
      print(e);
    }
  }

  signOut() {
    _auth.signOut();
  }

  completeProfile({email, firstname, lastname, phone, houseAddress}) {
    final ref = _firestore.collection('users').document();
    ref.setData({
      'email': email,
      'first-name': firstname,
      'last-name': lastname,
      'phone-number': phone,
      'house-address': houseAddress,
      'cart': cart,
      'gender': gender,
      'cart': cart,
      'pending-orders': pendingOrders,
      'favorites': favorites,
      'isSeller': isSeller,
      'advertised-products': advertisedProducts,
      'join-date': joinDate,
      'id': ref.documentID,
    });
    // try {
    //   _firestore.collection('users').add({
    //     'email': email,
    //     'first-name': firstname,
    //     'last-name': lastname,
    //     'phone-number': phone,
    //     'house-address': houseAddress,
    //     'cart': cart,
    //     'gender': gender,
    //     'cart': cart,
    //     'pending-orders': pendingOrders,
    //     'favorites': favorites,
    //     'isSeller': isSeller,
    //     'advertised-products': advertisedProducts,
    //     'join-date': joinDate,
    //     'id': ref.documentID,
    //   });
    // } catch (e) {
    //   print(e);
    // }
  }

  getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      return user;
    } catch (e) {
      print(e);
    }
  }

  getUserDetails() async {
    await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .snapshots()
        .listen((data) {
      firstname = data.documents[0]['first-name'];
      lastname = data.documents[0]['last-name'];
      phone = data.documents[0]['phone-number'];
      cart = data.documents[0]['cart'];
      favorites = data.documents[0]['favorites'];
      isSeller = data.documents[0]['isSeller'];
      advertisedProducts = data.documents[0]['advertised-products'];
      houseAddress = data.documents[0]['house-address'];
      userID = data.documents[0].documentID;
    });
  }

  becomeSeller() async {
    // getting the document ID

    // modifying the database based on the document ID
    await _firestore
        .collection('users')
        .document(userID)
        .updateData({'isSeller': true});
  }
}
