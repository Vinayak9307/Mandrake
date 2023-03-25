import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/views/seller/catalogue.dart';
import 'package:mandrake/views/seller/seller_profile.dart';
import '../../utils/global_colors.dart';
import '../buyer/cart.dart';

class SellerNavBar extends StatefulWidget {
  const SellerNavBar({super.key});
  @override
  State<SellerNavBar> createState() => _SellerNavBarState();
}

class _SellerNavBarState extends State<SellerNavBar> {
  int _selectedIndex = 0;
  final Widget _catalog = const Catalogue();
  final Widget _profile = const SellerProfile();
  final Widget _cart = const Cart();

  List<Widget>? screens;
  User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      screens = [
        _catalog,
        _cart,
        _profile,
      ];
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens![_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        backgroundColor: Colors.white,
        color: GlobalColor.mainColor,
        animationDuration: const Duration(milliseconds: 300),
        onTap: _onItemTapped,
        items: const [
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.add, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
      ),
    );
  }
}
