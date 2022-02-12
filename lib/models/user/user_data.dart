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
  List ordersToShip;
  List favorites;
  bool isMerchant;
  List advertisedProducts;
  String companyAddress;
  String companyName;
  String userID;
  String DOB;
  bool isVerified = false;
  String companyLogo;

  getCurrentDate() {
    final currentTime = DateTime.now();
    return '${currentTime.year}-${currentTime.month}-${currentTime.day}-${currentTime.hour}-${currentTime.minute}';
  }

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

  completeProfile(
      {email, firstname, lastname, phone, houseAddress, gender, DOB}) {
    final ref = _firestore.collection('users').document();
    this.email = email;
    this.firstname = firstname;
    this.lastname = lastname;
    this.phone = phone;
    this.houseAddress = houseAddress;
    this.gender = gender;
    this.DOB = DOB;

    try {
      ref.setData({
        'email': email,
        'first-name': firstname,
        'last-name': lastname,
        'phone-number': phone,
        'house-address': houseAddress,
        'cart': this.cart,
        'gender': gender,
        'cart': this.cart,
        'pending-orders': this.pendingOrders,
        'favorites': this.favorites,
        'isMerchant': false,
        'join-date': this.getCurrentDate(),
        'id': ref.documentID,
        'date-of-birth': DOB
      });
    } catch (e) {
      print(e);
    }
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
      this.firstname = data.documents[0]['first-name'];
      this.lastname = data.documents[0]['last-name'];
      this.phone = data.documents[0]['phone-number'];
      this.cart = data.documents[0]['cart'];
      this.favorites = data.documents[0]['favorites'];
      this.isMerchant = data.documents[0]['isMerchant'];
      this.advertisedProducts = data.documents[0]['advertised-products'];
      this.houseAddress = data.documents[0]['house-address'];
      this.userID = data.documents[0].documentID;
      this.gender = data.documents[0]['gender'];
      this.DOB = data.documents[0]['date-of-birth'];
      this.companyName = data.documents[0]['company-name'];
      this.companyName = data.documents[0]['company-address'];
    });
  }

  becomeSeller({companyName, companyAddress}) async {
    // getting the document ID
    final ref = _firestore.collection('users').document(userID);

    // modifying the database based on the document ID
    await _firestore.collection('users').document(userID).updateData({
      'isMerchant': true,
      'orders-to-ship': this.ordersToShip,
      'company-name': companyName,
      'company-address': companyAddress,
      'isVerified': this.isVerified,
      'advertised-products': this.advertisedProducts,
      'become-merchant-date': this.getCurrentDate(),
      'company-logo': this.companyLogo,
    });
  }
}
