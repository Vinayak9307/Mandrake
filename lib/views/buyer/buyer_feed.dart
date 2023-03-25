import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandrake/model/buyer.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/allCards.dart';
import '../../utils/global_colors.dart';
import 'drawer.dart';

class BuyerFeed extends StatefulWidget {
  const BuyerFeed({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuyerFeedState createState() => _BuyerFeedState();
}

class _BuyerFeedState extends State<BuyerFeed> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  Buyer? buyer;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    BuyerProvider buyerProvider = Provider.of(context, listen: false);
    Future.wait([
      loadUserData(buyerProvider),
    ]).then((value) => {
          isLoading = false,
        });
  }

  Future<String> loadUserData(buyerProvider) async {
    await buyerProvider.refreshUser();
    return "success";
  }

  //This method uses the user provider to load the user data
  //when the user comes to the home screen

  @override
  Widget build(BuildContext context) {
    Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    return Scaffold(
      key: _scaffoldKey,
      appBar: buildAppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Drawerr(),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('catalogitems')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length + 2,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                    0.2 -
                                                10,
                                        decoration: const BoxDecoration(
                                            color: GlobalColor.mainColor,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(36),
                                                bottomRight:
                                                    Radius.circular(36))),
                                        child: Row(
                                          children: <Widget>[
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18),
                                              child: Text('Mandrake',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 35)),
                                            ),
                                            Spacer(),
                                            Image.asset(
                                              "assets/images/logo.png",
                                              scale: 1.3,
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          height: 54,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                    offset: Offset(0, 10),
                                                    blurRadius: 50,
                                                    color: GlobalColor.mainColor
                                                        .withOpacity(0.23))
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 4, left: 8),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      hintText: 'Search',
                                                      hintStyle: TextStyle(
                                                        color: GlobalColor
                                                            .mainColor
                                                            .withOpacity(0.5),
                                                      ),
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SvgPicture.asset(
                                                      "assets/icons/search.svg"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }
                              if (index == snapshot.data!.docs.length + 1) {
                                return const SizedBox(height: 150);
                              }
                              return Padding(
                                padding: const EdgeInsets.all(16),
                                child: FeedCard(
                                  snap: snapshot.data!.docs[index - 1].data(),
                                ),
                              );
                            });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                  )
                ],
              ),
            ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: GlobalColor.mainColor,
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ));
  }
}
