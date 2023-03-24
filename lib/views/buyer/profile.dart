import 'package:flutter/material.dart';

import '../../utils/global_colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Profile',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("hello"),
      ),
    );
  }
}
