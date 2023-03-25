import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandrake/model/buyer.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/global_colors.dart';
import '../../utils/item_card.dart';

class BuyerFeed extends StatefulWidget {
  const BuyerFeed({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BuyerFeedState createState() => _BuyerFeedState();
}

class _BuyerFeedState extends State<BuyerFeed> {
  bool isLoading = true;
  Buyer? buyer;
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    loadUserData();
    setState(() {
      isLoading = false;
    });
  }

  loadUserData() async {
    BuyerProvider buyerProvider = Provider.of(context, listen: false);
    await buyerProvider.refreshUser();
    return "success";
  }

  //This method uses the user provider to load the user data
  //when the user comes to the home screen

  @override
  Widget build(BuildContext context) {
    Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    return Scaffold(
      appBar: buildAppBar(),
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
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                            0.2 -
                                        10,
                                    decoration: const BoxDecoration(
                                        color: GlobalColor.mainColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(36),
                                            bottomRight: Radius.circular(36))),
                                    child: Row(
                                      children: <Widget>[
                                        const Padding(
                                          padding: EdgeInsets.only(left: 18),
                                          child: Text('Mandrake',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 35)),
                                        ),
                                        const Spacer(),
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
                                                offset: const Offset(0, 10),
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
                                                    color: GlobalColor.mainColor
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
                          if (index == 9) return const SizedBox(height: 150);
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                FeedCard(),
                                Spacer(),
                                FeedCard(),
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
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
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ));
  }
}
