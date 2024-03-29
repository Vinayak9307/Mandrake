import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandrake/model/seller.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:mandrake/providers/seller_provider.dart';
import 'package:mandrake/views/buyer/buyer_feed.dart';
import 'package:mandrake/views/buyer/ask_help.dart';
import 'package:mandrake/views/buyer/login_view.dart';
import 'package:mandrake/views/buyer/profile.dart';
//import 'package:mandrake/views/buyer/profile.dart';
import 'package:mandrake/views/buyer/signup_view.dart';
import 'package:mandrake/views/onboarding.dart';
import 'package:mandrake/views/seller/add_to_catalogue.dart';
import 'package:mandrake/views/seller/orders_page.dart';
import 'package:mandrake/views/seller/seller_help_req.dart';
import 'package:mandrake/views/seller/seller_profile.dart';
// import 'package:mandrake/views/seller/profile.dart';
import 'package:mandrake/views/splash_view.dart';
import 'package:provider/provider.dart';

import 'views/seller/catalogue.dart';
import 'views/seller/catalogue_item_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BuyerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => SellerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Mandrake',
        routes: {
          '/onBoard': (context) => const OnBoarding(),
          '/login': (context) => const BuyerLoginView(),
          '/signup': (context) => const BuyerSignUpView(),
          '/stHomeScreen': (context) => const BuyerFeed(),
        },
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
