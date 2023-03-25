import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandrake/utils/drop_down_items.dart';
import 'package:provider/provider.dart';

import '../../firebase_resources/auth_methods.dart';
import '../../providers/buyer_provider.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profileURL = "";
  String tempHostel = "";
  String tempRoom = "";
  String hostel = "";
  String roomNo = "";

  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF0C9869),
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/menu.svg"),
          onPressed: () {},
        ),
      ),
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15 - 10,
                      decoration: const BoxDecoration(
                          color: Color(0xFF0C9869),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                              bottomRight: Radius.circular(36))),
                    ),
                    Positioned(
                      left: 150,
                      right: 0,
                      top: 60,
                      child: Stack(children: [
                        Container(
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage(
                              "assets/images/index.png",
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 155,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Color(0xFF0C9869),
                            ),
                            child: GestureDetector(
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                              onTap: () {
                                uploadImage();
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Text("Vinayak",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18)),
              //for spacing
              const SizedBox(
                height: 5,
              ),
              Text("vinayak1289@gmail.com",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18)),

              //this row contains the buttons to see complaints filed and complaints resolved

              //for spacing
              const SizedBox(
                height: 30,
              ),

              //this is a card which contains listtile of hostel
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  subtitle: Text(hostel,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text(
                    'Mobile',
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(1);
                    },
                  ),
                ),
              ),

              //for spacing
              const SizedBox(
                height: 30,
              ),

              //this is a card which contains listtile of hostel
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                  subtitle: Text(roomNo,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text('Address'),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(2);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0C9869),
                        ),
                        child: const Text(
                          "data",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0C9869),
                        ),
                        child: const Text(
                          "data",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> _onEditPressed(var flag) =>

      //a pop up box would be opened for the user to write the new hostel name or Room no
      showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
                title: flag == 1
                    ? const Text('Hostel name')
                    : const Text('Room No.'),

                //this is the text field for filling the new hostel name or Room no
                content: flag == 1
                    ? TextField(
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter Room No.'),
                        //controller: controller,
                        onChanged: (value) {
                          setState(() {
                            hostel = value;
                          });
                        },
                      )
                    : TextField(
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter Room No.'),
                        //controller: controller,
                        onChanged: (value) {
                          setState(() {
                            tempRoom = value;
                          });
                        },
                      ),

                //action for submit button of pop up
                actions: [
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      submit();
                    },
                  ),
                ],
              ));

  void submit() {
    setState(() {
      hostel = tempHostel;
      roomNo = tempRoom;
    });
    // AuthMethods().changeState("hostel", hostel, userMap);
    // AuthMethods().changeState("roomNo", roomNo, userMap);
    // loadUserData();
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  loadUserData() async {
    BuyerProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  uploadImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // String tempProfileURL = await StorageMethods()
    //     .uploadImageToStorage("profilePic", im, false, null);
    // setState(() {
    //   profileURL = tempProfileURL;
    //   AuthMethods().changeState("profileURL", profileURL!, userMap);
    // });
  }
}
