import 'package:flutter/material.dart';

class SellerLoginView extends StatefulWidget {
  const SellerLoginView({super.key});

  @override
  State<SellerLoginView> createState() => SellerLoginViewState();
}

class SellerLoginViewState extends State<SellerLoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is Buyer login view"),
      ),
    );
  }
}
