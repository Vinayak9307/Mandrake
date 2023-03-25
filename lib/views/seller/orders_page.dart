import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mandrake/utils/global_colors.dart';
import 'package:mandrake/utils/orders_card.dart';
// import 'package:mandrake/views/user/drawer.dart';
import 'package:mandrake/providers/seller_provider.dart';
// import 'package:querium/models/user.dart' as model;

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        title: const Text(
          'Orders',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          // itemCount: snapshot.data!.docs.length,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const PostCardView(
                //snap: snapshot.data!.docs[index].data(),
                //user: user,
                );
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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Drawer(),
            ],
          ),
        ),
      ),
    );
  }
}
