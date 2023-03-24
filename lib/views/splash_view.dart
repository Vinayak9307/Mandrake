import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/utils/global_colors.dart';
import 'package:mandrake/views/onboarding.dart';
import 'package:mandrake/views/seller/seller_nav_bar.dart';

import 'buyer/nav_bar.dart';

// ignore: camel_case_types
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

// ignore: camel_case_types
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.wait([
      getUserData(),
      Future.delayed(
        const Duration(milliseconds: 3000),
      ),
    ]).then((snapshot) {
      String user = (snapshot.first as String);
      Widget next = user == "onBoard"
          ? const OnBoarding()
          : user == "user"
              ? const NavBar()
              : const SellerNavBar();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => next,
        ),
      );
    });
  }

  Future<String> getUserData() async {
    if (FirebaseAuth.instance.currentUser == null) return "onBoard";
    DocumentReference ref = FirebaseFirestore.instance
        .collection('type')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    DocumentSnapshot snap = await ref.get();
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;

    return map['type'];
  }

  @override
  Widget build(BuildContext context) {
    //Timer(const Duration(seconds: 2), () {Get.to(LoginView()); });
    return const Scaffold(
      backgroundColor: GlobalColor.mainColor,
      body: Center(
        child: Text(
          "Mandrake",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void waitForLoad(uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).get();
  }
}
