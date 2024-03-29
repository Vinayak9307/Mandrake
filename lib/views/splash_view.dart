import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/utils/global_colors.dart';
import 'package:mandrake/views/onboarding.dart';
import 'package:mandrake/views/seller/seller_nav_bar.dart';
import 'package:provider/provider.dart';

import '../providers/buyer_provider.dart';
import '../providers/seller_provider.dart';
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
    BuyerProvider buyerProvider = Provider.of(context, listen: false);
    SellerProvider sellerProvider = Provider.of(context, listen: false);
    Future.wait([
      getUserData(buyerProvider, sellerProvider),
      Future.delayed(const Duration(milliseconds: 2000)),
    ]).then((snapshot) {
      String user = snapshot.first;
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

  Future<String> getUserData(
      BuyerProvider buyerProvider, SellerProvider sellerProvider) async {
    if (FirebaseAuth.instance.currentUser == null) return "onBoard";
    print(FirebaseAuth.instance.currentUser!.uid);
    DocumentReference ref = FirebaseFirestore.instance
        .collection('type')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    DocumentSnapshot snap = await ref.get();
    Map<String, dynamic> map = snap.data() as Map<String, dynamic>;
    print(map['type']);

    if (map['type'] == 'user') {
      await buyerProvider.refreshUser();
    } else {
      await sellerProvider.refreshSeller();
    }
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
