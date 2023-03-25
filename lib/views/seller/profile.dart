// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../firebase_resources/auth_methods.dart';
// import '../../utils/utils.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   String? profileURL = "";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Profile",
//           style: TextStyle(fontSize: 22),
//         ),
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: const Color(0xFF0C9869),
//         leading: IconButton(
//           icon: SvgPicture.asset("assets/images/menu.svg"),
//           onPressed: () {},
//         ),
//       ),
//       body: GestureDetector(
//         onTap: () => {
//           FocusScope.of(context).requestFocus(
//             FocusNode(),
//           ),
//         },
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.22,
//                 child: Stack(
//                   children: <Widget>[
//                     Container(
//                       height: MediaQuery.of(context).size.height * 0.15 - 10,
//                       decoration: const BoxDecoration(
//                           color: Color(0xFF0C9869),
//                           borderRadius: BorderRadius.only(
//                               bottomLeft: Radius.circular(36),
//                               bottomRight: Radius.circular(36))),
//                     ),
//                     Positioned(
//                       left: 0,
//                       right: 0,
//                       top: 60,
//                       child: Container(
//                         child: const CircleAvatar(
//                           radius: 60,
//                           backgroundImage:
//                               AssetImage("assets/images/index.png"),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 20,
//                       right: 155,
//                       child: Container(
//                         width: 35,
//                         height: 35,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(100),
//                           color: Color(0xFF0C9869),
//                         ),
//                         child: GestureDetector(
//                           child: const Icon(
//                             Icons.camera_alt_outlined,
//                             color: Colors.black,
//                           ),
//                           onTap: () {
//                             uploadImage(userMap);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Text("name",
//                   style: TextStyle(
//                       fontFamily: GoogleFonts.poppins().fontFamily,
//                       fontSize: 20)),
//               //for spacing
//               const SizedBox(
//                 height: 5,
//               ),
//               Text("email",
//                   style: TextStyle(
//                       fontFamily: GoogleFonts.poppins().fontFamily,
//                       fontSize: 20)),

//               //this row contains the buttons to see complaints filed and complaints resolved
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: const [
//                   //complaintsButton(complaintFiled, 'complaints pending',
//                   // onTapPending, false),
//                   //complaintsButton(
//                   // solvedComplaint, 'solved complaint', onTapsolved, false),
//                 ],
//               ),
//               //for spacing
//               const SizedBox(
//                 height: 30,
//               ),

//               //this is a card which contains listtile of hostel
//               Card(
//                 elevation: 5,
//                 child: ListTile(
//                   leading: const Icon(
//                     Icons.phone,
//                     size: 30,
//                   ),
//                   subtitle: const Text("Mobile",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                   title: const Text(
//                     'Mobile',
//                   ),
//                   trailing: GestureDetector(
//                     child: const Icon(Icons.edit),
//                     onTap: () async {
//                       //await _onEditPressed(1, userMap);
//                     },
//                   ),
//                 ),
//               ),

//               //for spacing
//               const SizedBox(
//                 height: 30,
//               ),

//               //this is a card which contains listtile of hostel
//               Card(
//                 elevation: 5,
//                 child: ListTile(
//                   leading: const Icon(
//                     Icons.home,
//                     size: 30,
//                   ),
//                   subtitle: const Text("Address",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
//                   title: const Text('Address'),
//                   trailing: GestureDetector(
//                     child: const Icon(Icons.edit),
//                     onTap: () async {
//                       // await _onEditPressed(2, userMap);
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.2,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, right: 8),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       height: 45,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF0C9869),
//                         ),
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                     const Spacer(),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       height: 45,
//                       child: ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF0C9869),
//                         ),
//                         child: Text(
//                           "data",
//                           style: TextStyle(fontSize: 18),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   uploadImage(userMap) async {
//     Uint8List im = await pickImage(ImageSource.gallery);
//     String tempProfileURL = await StorageMethods()
//         .uploadImageToStorage("profilePic", im, false, null);
//     setState(() {
//       profileURL = tempProfileURL;
//       AuthMethods().changeState("profileURL", profileURL!, userMap);
//     });
//   }
// }
