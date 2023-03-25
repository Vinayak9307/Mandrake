import 'package:flutter/material.dart';
import 'package:mandrake/model/seller.dart';

import '../firebase_resources/auth_methods.dart';

//This class is used as the singleton class for the user
//It provides the user object
class SellerProvider with ChangeNotifier {
  Seller? _seller;

  Seller get getseller => _seller!;

  Future<void> refreshSeller() async {
    Seller seller = await AuthMethods().getUserDetails('seller');
    _seller = seller;
    notifyListeners();
  }
}
