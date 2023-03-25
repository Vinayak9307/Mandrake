import 'package:flutter/material.dart';
import 'package:mandrake/firebase_resources/auth_methods.dart';
import 'package:mandrake/utils/button_global.dart';

import '../../utils/utils.dart';
import '../onboarding.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void logOutUser() async {
    String res = await AuthMethods().logoutUser();
    if (res != "Log Out Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoarding()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonGlobal(
          text: "Log Out",
          onTap: () {
            logOutUser();
          },
        ),
      ),
    );
  }
}
