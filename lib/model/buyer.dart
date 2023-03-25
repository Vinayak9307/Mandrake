// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class Buyer {
  String? uid;
  String? username;
  String? profileURL;
  String? email;
  String? phoneNo;
  String? address;
  String? orders;
  String? cart;
  List? posts;

  Buyer({
    this.uid,
    this.username,
    this.email,
    this.address,
    this.profileURL,
    this.phoneNo,
    this.orders,
    this.cart,
    this.posts,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "username": username,
        "email": email,
        "profileURL": profileURL,
        "phoneNo": phoneNo,
        "address": address,
        "orders": orders,
        "cart": cart,
        "posts": posts,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static Buyer getUser(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return Buyer(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      profileURL: map['profileURL'],
      phoneNo: map['phoneNo'],
      orders: map['orders'],
      cart: map['cart'],
      address: map['address'],
      posts: map['posts'],
    );
  }
}
