import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/views/buyer/profile.dart';
import '../../utils/global_colors.dart';
import 'buyer_feed.dart';
import 'cart.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final Widget _stuHomeScreen = const BuyerFeed();
  final Widget _profile = const Profile();
  final Widget _cart = const Cart();

  List<Widget>? screens;
  User? user = FirebaseAuth.instance.currentUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      screens = [
        _stuHomeScreen,
        _profile,
        _cart,
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
