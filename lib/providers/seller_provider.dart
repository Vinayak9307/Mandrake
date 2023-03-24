// import 'package:flutter/material.dart';
// import 'package:querium/resources/auth_methods.dart';

// import '../models/admin.dart';

// //This class is used as the singleton class for the user
// //It provides the user object
// class AdminProvider with ChangeNotifier {
//   Admin? _admin;

//   Admin get getAdmin => _admin!;

//   Future<void> refreshAdmin() async {
//     Admin admin = await AuthMethods().getAdminDetails();
//     _admin = admin;
//     notifyListeners();
//   }
// }