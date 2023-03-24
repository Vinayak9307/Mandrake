import 'package:flutter/material.dart';
import 'package:mandrake/views/seller/login_view_admin.dart';
import '../utils/button_global.dart';
import '../utils/global_colors.dart';
import 'buyer/login_view.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 23,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Mandrake",
                  style: TextStyle(
                    color: GlobalColor.mainColor,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // Image.asset(
              //   "assets/images/onboard.png",
              //   fit: BoxFit.cover,
              // ),
              const SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BuyerLoginView()),
                  );
                },
                child: const ButtonGlobal(
                  text: "Buyer",
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SellerLoginView()),
                  );
                },
                child: const ButtonGlobal(
                  text: "Seller",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
