// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class Seller {
  String? uid;
  String? username;
  String? profileURL;
  String? email;
  String? phoneNo;
  String? address;
  List? pendingOrders;
  List? completedOrders;
  String? bankAccountNumber;
  String? ifscCode;
  String? bankName;
  int? sizeOfNursery;
  int? variety;
  bool? approved;
  List? catalog;
  String? country;
  String? city;
  String? state;

  Seller({
    this.uid,
    this.username,
    this.email,
    this.profileURL,
    this.phoneNo,
    this.address,
    this.pendingOrders,
    this.completedOrders,
    this.bankAccountNumber,
    this.bankName,
    this.ifscCode,
    this.sizeOfNursery,
    this.variety,
    this.approved,
    this.catalog,
    this.country,
    this.state,
    this.city,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "username": username,
        "email": email,
        "profileURL": profileURL,
        "phoneNo": phoneNo,
        "address": address,
        "pendingOrders": pendingOrders,
        "completedOrders": completedOrders,
        "bankAccountNumber": bankAccountNumber,
        "ifscCode": ifscCode,
        "bankName": bankName,
        "variety": variety,
        "sizeOfNursery": sizeOfNursery,
        "approved": approved,
        "catalog": catalog,
        "country": country,
        "state": state,
        "city": city,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static Seller getUser(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return Seller(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      profileURL: map['profileURL'],
      phoneNo: map['phoneNo'],
      pendingOrders: map['pendingOrders'],
      completedOrders: map['completedOrders'],
      bankAccountNumber: map['bankAccountNumber'],
      bankName: map['bankName'],
      ifscCode: map['ifscCode'],
      address: map['address'],
      variety: map['variety'],
      sizeOfNursery: map['sizeOfNursery'],
      approved: map['approved'],
      catalog: map['catalog'],
      country: map['country'],
      state: map['state'],
      city: map['city'],
    );
  }
}
