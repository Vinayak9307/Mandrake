import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:mandrake/views/buyer/buyer_feed.dart';
import 'package:mandrake/views/buyer/create_post.dart';
import 'package:mandrake/views/buyer/login_view.dart';
import 'package:mandrake/views/buyer/profile.dart';
import 'package:mandrake/views/buyer/signup_view.dart';
import 'package:mandrake/views/onboarding.dart';
import 'package:mandrake/views/seller/profile.dart';
import 'package:mandrake/views/splash_view.dart';
import 'package:provider/provider.dart';

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
        // ChangeNotifierProvider(
        //   create: (_) => AdminProvider(),
        // ),
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
        home: const CreatePost(),
      ),
    );
  }
}
