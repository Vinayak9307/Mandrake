import 'package:flutter/material.dart';
import 'package:mandrake/model/buyer.dart';
import '../firebase_resources/auth_methods.dart';

//This class is used as the singleton class for the user
//It provides the user object
class BuyerProvider with ChangeNotifier {
  Buyer? _buyer;

  Buyer get getBuyer => _buyer!;

  Future<void> refreshUser() async {
    Buyer user = await AuthMethods().getUserDetails('users');
    _buyer = user;
    notifyListeners();
  }
}
