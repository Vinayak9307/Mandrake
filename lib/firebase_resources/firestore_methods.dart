import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/firebase_resources/auth_methods.dart';
import 'package:mandrake/firebase_resources/storage_methods.dart';
import 'package:mandrake/model/catalogue_item.dart';
import 'package:mandrake/model/order.dart';
import 'package:mandrake/model/request.dart';
import 'package:mandrake/views/seller/add_to_catalogue.dart';
import 'package:mandrake/views/seller/catalogue.dart';
import 'package:uuid/uuid.dart';

import '../model/seller.dart';

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

  Future<String> addHelpRequest(
      {required Request request, required List<Uint8List> images}) async {
    String res = "Some error occured";
    Map<String, dynamic> compMap = request.getData();
    var uid = compMap['uid'];
    var name = compMap['name'];
    var reqId = compMap['reqId'];
    var email = compMap['email'];
    var address = compMap['address'];
    var title = compMap['title'];
    var description = compMap['description'];
    List<String> imgURL = [];
    var filingTime = compMap['filingTime'];
    var accepted = compMap['accepted'];

    try {
      for (int i = 0; i < images.length; i++) {
        imgURL.add(await StorageMethods()
            .uploadImageToStorage('complaints', images[i], true, reqId));
      }
      Request request1 = Request(
        uid: uid,
        reqId: reqId,
        email: email,
        address: address,
        title: title,
        description: description,
        filingTime: filingTime,
        images: imgURL,
        name: name,
        accepted: accepted,
      );

      await _firestore
          .collection('requests')
          .doc(request1.reqId)
          .set(request1.getData());

      res = "Upload Success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }

  Future<String> addCatalogue(
      {required CatalogueItem catalogue,
      required Uint8List images,
      required Seller seller}) async {
    String res = "Some error occured";
    Map<String, dynamic> compMap = catalogue.getData();
    var uid = compMap['uid'];
    var itemName = compMap['itemName'];
    var sellerId = compMap['sellerId'];
    var sellerInfo = compMap['sellerInfo'];
    var description = compMap['description'];
    String imgURL = compMap['profileURL'];
    int quantity = compMap['quantity'];
    int price = compMap['price'];

    try {
      imgURL = await StorageMethods()
          .uploadImageToStorage('complaints', images, false, null);

      CatalogueItem catalogueItem = CatalogueItem(
        uid: uid,
        itemName: itemName,
        profileURL: imgURL,
        description: description,
        quantity: quantity,
        sellerId: sellerId,
        sellerInfo: sellerInfo,
        price: price,
      );

      await _firestore
          .collection('catalogueItem')
          .doc(catalogueItem.uid)
          .set(catalogueItem.getData());
      List catList = seller.catalog!;
      catList.add(catalogueItem.uid);
      AuthMethods().changeState("seller", "catalog", catList, seller.getData());

      res = "Upload Success";
    } catch (err) {
      res = err.toString();
    }

    return res;
  }
}
