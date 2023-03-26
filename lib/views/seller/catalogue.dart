import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandrake/providers/seller_provider.dart';
import 'package:mandrake/utils/allCards.dart';
import 'package:provider/provider.dart';

import '../../model/seller.dart';
import '../../utils/global_colors.dart';
import '../drawer.dart';

class Catalogue extends StatefulWidget {
  const Catalogue({super.key});

  @override
  State<Catalogue> createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Seller seller = Provider.of<SellerProvider>(context).getseller;
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('catalogueItem')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return CatalogueCard(snap: snapshot.data!.docs[index].data());
                });
          }),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: GlobalColor.mainColor,
        centerTitle: true,
        title: Text(
          'Your Catalogue',
        ),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ));
  }
}
