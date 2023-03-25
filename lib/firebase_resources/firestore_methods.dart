import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/firebase_resources/storage_methods.dart';
import 'package:mandrake/model/order.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> placeOrder({required OrderItem order}) async {
    String res = "Some error occured";
    Map<String, dynamic> orderMap = order.getData();
    var buyerId = orderMap['buyerId'];
    var sellerId = orderMap['sellerId'];
    var orderId = const Uuid().v1();
    var itemName = orderMap['itemName'];
    var sellerInfo = orderMap['sellerInfo'];
    var address = orderMap['buyerAddress'];
    var completed = orderMap['completed'];

    OrderItem orderItem = OrderItem(
      buyerId: buyerId,
      sellerId: sellerId,
      sellerInfo: sellerInfo,
      orderId: orderId,
      itemName: itemName,
      buyerAddress: address,
      completed: completed,
    );

    try {
      await _firestore
          .collection('orders')
          .doc(orderId)
          .set(orderItem.getData());

      res = "Upload Success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
