import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/model/seller.dart';
import 'package:mandrake/providers/seller_provider.dart';
import 'package:mandrake/utils/global_colors.dart';
import 'package:mandrake/views/seller/seller_profile.dart';
import 'package:provider/provider.dart';

import '../../utils/allCards.dart';
import '../drawer.dart';
// import 'package:querium/models/user.dart' as model;

class HelpRequestPage extends StatefulWidget {
  const HelpRequestPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpRequestPageState createState() => _HelpRequestPageState();
}

class _HelpRequestPageState extends State<HelpRequestPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  //This method uses the user provider to load the user data
  //when the user comes to the home screen
  loadUserData() async {
    // UserProvider userProvider = Provider.of(context, listen: false);
    // await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    //model.User user = Provider.of<UserProvider>(context).getUser;
    Seller seller = Provider.of<SellerProvider>(context).getseller;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Drawerr(
                snap: seller.getData(),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Help Requests',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('requests').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                // itemCount: snapshot.data!.docs.length,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return HelpCardView(
                    snap: snapshot.data!.docs[index].data(),
                    //user: user,
                  );
                });
          }),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('complaints').snapshots(),
      //   builder: (context,
      //       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     return ListView.builder(
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (context, index) {
      //           return PostCardView(
      //             snap: snapshot.data!.docs[index].data(),
      //             //user: user,
      //           );
      //         });
      //   },
      // ),
    );
  }
}
