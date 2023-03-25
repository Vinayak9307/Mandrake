// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class CatalogItem {
  String? uid;
  String? itemName;
  String? profileURL;
  String? sellerInfo;
  String? sellerId;
  String? description;
  String? quantity;
  String? price;

  CatalogItem({
    this.uid,
    this.itemName,
    this.sellerInfo,
    this.price,
    this.sellerId,
    this.profileURL,
    this.description,
    this.quantity,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "uid": uid,
        "itemName": itemName,
        "sellerInfo": sellerInfo,
        "profileURL": profileURL,
        "description": description,
        "price": price,
        "quantity": quantity,
        "sellerId": sellerId,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static CatalogItem getCatalogItem(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return CatalogItem(
      uid: map['uid'],
      itemName: map['itemName'],
      sellerInfo: map['sellerInfo'],
      profileURL: map['profileURL'],
      description: map['description'],
      price: map['price'],
      quantity: map['quantity'],
      sellerId: map['sellerId'],
    );
  }
}
