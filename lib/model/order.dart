// This class is used as the user model class
import 'package:cloud_firestore/cloud_firestore.dart';

class OrderItem {
  String? buyerId;
  String? orderId;
  String? sellerId;
  String? itemName;
  String? sellerInfo;
  String? buyerAddress;
  bool? completed;

  OrderItem({
    this.buyerId,
    this.orderId,
    this.sellerId,
    this.itemName,
    this.sellerInfo,
    this.buyerAddress,
    this.completed,
  });

  //This function returns a map of data related to the user object
  Map<String, dynamic> getData() => {
        "buyerId": buyerId,
        "orderId": orderId,
        "sellerId": sellerId,
        "itemName": itemName,
        "sellerInfo": sellerInfo,
        "buyerAddress": buyerAddress,
        "completed": completed,
      };

  //This method returns a user instance based on the document snapshot given by firebase authentication
  static OrderItem getOrderItem(DocumentSnapshot snap) {
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return OrderItem(
      buyerId: map['buyerId'],
      orderId: map['orderId'],
      sellerId: map['sellerId'],
      itemName: map['itemName'],
      sellerInfo: map['sellerInfo'],
      buyerAddress: map['buyerAddress'],
      completed: map['completed'],
    );
  }
}
