import 'package:cloud_firestore/cloud_firestore.dart';

class Request {
  String uid;
  String reqId;
  String name;
  String email;
  String address;
  String title;
  String description;
  List<String> images = [];
  DateTime filingTime;
  bool accepted;

  Request({
    required this.uid,
    required this.reqId,
    required this.email,
    required this.address,
    required this.title,
    required this.description,
    required this.filingTime,
    required this.images,
    required this.name,
    required this.accepted,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        'uid': uid,
        'reqId': reqId,
        'email': email,
        'address': address,
        'title': title,
        'description': description,
        'filingTime': filingTime,
        'images': images,
        'name': name,
        'accepted': accepted,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static Request getUser(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return Request(
      uid: map['uid'],
      reqId: map['reqId'],
      email: map['email'],
      address: map['address'],
      title: map['title'],
      description: map['description'],
      filingTime: map['filingTime'],
      images: map['images'],
      name: map['name'],
      accepted: map['accepted'],
    );
  }
}
