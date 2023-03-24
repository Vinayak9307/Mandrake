import 'package:flutter/material.dart';

class BuyerLoginView extends StatefulWidget {
  const BuyerLoginView({super.key});

  @override
  State<BuyerLoginView> createState() => _BuyerLoginViewState();
}

class _BuyerLoginViewState extends State<BuyerLoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("This is Buyer login view"),
      ),
    );
  }
}
