
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mandrake/firebase_resources/auth_methods.dart';
import 'package:mandrake/utils/global_colors.dart';

// import '../models/admin.dart';
// import '../views/admin/complaint_detail.dart';

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
