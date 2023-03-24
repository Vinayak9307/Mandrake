// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:querium/models/notifications.dart';
// import 'package:querium/resources/auth_methods.dart';
// import 'package:querium/resources/firestore_methods.dart';
// import 'package:querium/utils/global_colors.dart';
// import 'package:querium/views/user/querry_detail.dart';

// import '../models/admin.dart';
// import '../models/notifications.dart' as model;
// import '../views/admin/complaint_detail.dart';

// class PostCardView extends StatelessWidget {
//   const PostCardView({super.key, required this.snap, required this.user});
//   final snap;
//   final user;
//   static bool pressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//       child: SizedBox(
//           child: InkWell(
//         onTap: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             if (user.runtimeType == Admin) {
//               return ComplaintDetail(
//                 snap: snap,
//                 admin: user,
//               );
//             } else {
//               return QueryDetail(
//                 snap: snap,
//               );
//             }
            
//           }));
//         },
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: const Color.fromARGB(255, 211, 223, 243),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.1),
//                   blurRadius: 10,
//                 )
//               ]),
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   snap['title'],
//                   textAlign: TextAlign.start,
//                   style: const TextStyle(
//                     fontSize: 22,
//                     color: Color.fromARGB(255, 60, 58, 58),
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                   const Text(
//                     "posted by  -  ",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Color.fromARGB(255, 78, 76, 76),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Text(
//                     snap['email'],
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Color.fromARGB(255, 78, 76, 76),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   const Icon(Icons.timeline),
//                   const SizedBox(
//                     width: 8,
//                   ),
//                   Text(
//                     DateFormat.yMMMd().format(
//                       snap['filingTime'].toDate(),
//                     ),
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Color.fromARGB(255, 78, 76, 76),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const Text(
//                     " in ",
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Color.fromARGB(255, 78, 76, 76),
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Text(
//                     snap['hostel'],
//                     textAlign: TextAlign.start,
//                     style: const TextStyle(
//                       fontSize: 12,
//                       color: Color.fromARGB(255, 78, 76, 76),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   snap['description'].substring(
//                           0, min((snap['description'] as String).length, 40)) +
//                       "...",
//                   textAlign: TextAlign.start,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Color.fromARGB(255, 52, 51, 51),
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.005,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: MediaQuery.of(context).size.width * 0.12,
//                     width: MediaQuery.of(context).size.width * 0.3,
//                     padding: const EdgeInsets.all(3),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color: Colors.white,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Text(
//                           snap['status'],
//                           textAlign: TextAlign.start,
//                           style: const TextStyle(
//                             fontSize: 15,
//                             color: Color.fromARGB(255, 78, 76, 76),
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         //SizedBox(height: MediaQuery.of(context).size.height*0.015,),
//                         const Text(
//                           "Status",
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Color.fromARGB(255, 78, 76, 76),
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.1,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.3,
//                     height: MediaQuery.of(context).size.width * 0.12,
//                     //color: Colors.orange,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         List<dynamic> up = snap['upvotes'];
//                         bool flag = true;
//                         for (var i in up) {
//                           if (user.uid == i) {
//                             flag = false;
//                           }
//                         }
//                         print(user);
//                         if (flag) {
//                           up.add(user.uid);
//                           AuthMethods()
//                               .changeComplaintState("upvotes", up, snap);
//                           FirestoreMethods().uploadNotification(notification: model.Notification(uid: snap['uid'],email: user.email , title: "Upvote" , message: "Your complaint is upvoted"));
//                         }
//                         pressed = true;
//                       },
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: GlobalColor.mainColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8))),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(Icons.arrow_upward),
//                           Text(
//                             snap['upvotes'].length.toString() + " Upvote",
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
