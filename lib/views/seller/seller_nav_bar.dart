import 'package:flutter/material.dart';

class SellerNavBar extends StatefulWidget {
  const SellerNavBar({super.key});

  @override
  State<SellerNavBar> createState() => _SellerNavBarState();
}

class _SellerNavBarState extends State<SellerNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is seller nav bar"),
      ),
    );
  }
}
