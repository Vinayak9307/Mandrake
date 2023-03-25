import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../views/buyer/item_detail.dart';
import '../views/seller/catalogue_item_detail.dart';
import '../views/seller/seller_help_req_detail.dart';
import 'global_colors.dart';

class CatalogueCard extends StatelessWidget {
  const CatalogueCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.35,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CatalogueItemDetail()));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: GlobalColor.mainColor.withOpacity(0.23),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: const Text(
                  'Species name',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 - 60,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  "assets/images/img.png",
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: GlobalColor.mainColor.withOpacity(0.23),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Quantity-10',
                      style: TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      'Price-100',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: GlobalColor.mainColor.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

//help_req_card

class HelpCardView extends StatelessWidget {
  const HelpCardView({
    super.key,
    // required this.snap,
    // this.user,
  });
  // final snap;
  // final user;
  static bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox(
          child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HelpCardDetailView()));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => HelpCardDetailView(
          //               snap: snap,
          //             )));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 211, 223, 243),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ]),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "snap['title']",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 60, 58, 58),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: const [
                  Text(
                    "ordered by  -  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "snap['email']",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.timeline),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    //"DateFormat.yMMMd().format( snap['filingTime'].toDate(),)",
                    "date",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        //"DateFormat.yMMMd().format( snap['filingTime'].toDate(),)",
                        "addressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddress",
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 76, 76),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  // snap['description'].substring(
                  //         0, min((snap['description'] as String).length, 40)) +
                  //     "...",
                  "description...",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 52, 51, 51),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

//feedCard

class FeedCard extends StatelessWidget {
  const FeedCard({super.key, this.snap});
  final snap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.3,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ItemDetail(
                        snap: snap,
                      )));
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3 - 50,
              width: MediaQuery.of(context).size.width * 0.4,
              child: Image.network(
                snap['profileURL'],
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: GlobalColor.mainColor.withOpacity(0.23),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  Text(
                    snap['itemName']!,
                    style: TextStyle(fontSize: 17),
                  ),
                  const Spacer(),
                  Text(
                    snap['price'].toString(),
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: GlobalColor.mainColor.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//orderscard

class PostCardView extends StatelessWidget {
  const PostCardView({
    super.key,
    // required this.snap,
  });
  //final snap;
  //final user;
  static bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox(
          child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   if (user.runtimeType == Admin) {
          //     return ComplaintDetail(
          //       snap: snap,
          //       admin: user,
          //     );
          //   } else {
          //     return QueryDetail(
          //       snap: snap,
          //     );
          //   }

          // }));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 211, 223, 243),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                )
              ]),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "snap['title']",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 60, 58, 58),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: const [
                  Text(
                    "ordered by  -  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "snap['email']",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.timeline),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    //"DateFormat.yMMMd().format( snap['filingTime'].toDate(),)",
                    "date",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        //"DateFormat.yMMMd().format( snap['filingTime'].toDate(),)",
                        "addressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddressaddress",
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 76, 76),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.005,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  //color: Colors.orange,
                  child: ElevatedButton(
                    onPressed: () {
                      // List<dynamic> up = snap['upvotes'];
                      // bool flag = true;
                      // for (var i in up) {
                      //   if (user.uid == i) {
                      //     flag = false;
                      //   }
                      // }
                      // print(user);
                      // if (flag) {
                      //   up.add(user.uid);
                      //   AuthMethods()
                      //       .changeComplaintState("upvotes", up, snap);
                      //   FirestoreMethods().uploadNotification(
                      //       notification: model.Notification(
                      //           uid: snap['uid'],
                      //           email: user.email,
                      //           title: "Upvote",
                      //           message: "Your complaint is upvoted"));
                      // }
                      // pressed = true;
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: GlobalColor.mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        //" snap['upvotes'].length.toString() + "
                        //   "Upvote"
                        //   ""
                        Text("Order Completed"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
