import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandrake/views/buyer/drawer.dart';
import 'package:provider/provider.dart';
import '../../firebase_resources/auth_methods.dart';
import '../../firebase_resources/storage_methods.dart';
import '../../model/buyer.dart';
import '../../providers/buyer_provider.dart';
import '../../utils/utils.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? profileURL = "";
  String tempPhoneNo = "";
  String tempAddress = "";
  String phoneNo = "";
  String address = "";

  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    // tempPhoneNo = buyer.phoneNo!;
    // tempAddress = buyer.address!;
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              Drawerr(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xFF0C9869),
        leading: IconButton(
          icon: SvgPicture.asset("assets/images/menu.svg"),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
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
                      left: MediaQuery.of(context).size.width * 0.5 - 60,
                      // right: 0,
                      // top: 60,
                      bottom: 0,
                      child: Stack(children: [
                        buyer.profileURL != null && buyer.profileURL != ""
                            ? CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    NetworkImage(buyer.profileURL!),
                              )
                            : const CircleAvatar(
                                radius: 60,
                                backgroundImage:
                                    AssetImage("assets/images/index.png"),
                              ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xFF0C9869),
                            ),
                            child: GestureDetector(
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                              onTap: () {
                                uploadImage(buyer);
                              },
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
              Text(buyer.username!,
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18)),
              //for spacing
              const SizedBox(
                height: 5,
              ),
              Text(buyer.email!,
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18)),

              //this row contains the buttons to see complaints filed and complaints resolved

              //for spacing
              const SizedBox(
                height: 30,
              ),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  subtitle: Text(buyer.phoneNo!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text(
                    'Mobile',
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(1, buyer);
                    },
                  ),
                ),
              ),

              //for spacing
              const SizedBox(
                height: 30,
              ),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                  subtitle: Text(buyer.address!,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text('Address'),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(2, buyer);
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
                          "Orders",
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
                          "Cart",
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

  Future<String?> _onEditPressed(var flag, Buyer buyer) =>

      //a pop up box would be opened for the user to write the new phoneNo name or Room no
      showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
                title: flag == 1
                    ? const Text('Mobile No')
                    : const Text('Address '),

                //this is the text field for filling the new phoneNo name or Room no
                content: flag == 1
                    ? TextField(
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter mobile no'),
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            tempPhoneNo = value;
                          });
                        },
                      )
                    : TextField(
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter address '),
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            tempAddress = value;
                          });
                        },
                      ),

                //action for submit button of pop up
                actions: [
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      submit(flag, buyer);
                    },
                  ),
                ],
              ));

  void submit(var flag, Buyer buyer) async {
    if (flag == 1) {
      phoneNo = tempPhoneNo;
    } else if (flag == 2) {
      address = tempAddress;
    }
    Map<String, dynamic> map = buyer.getData();

    AuthMethods().changeState('users', "phoneNo", phoneNo, map);
    AuthMethods().changeState("users", "address", address, map);
    loadUserData();
    Navigator.of(context).pop(controller.text);
    controller.clear();
  }

  loadUserData() async {
    BuyerProvider userProvider = Provider.of(context, listen: false);
    await userProvider.refreshUser();
  }

  uploadImage(Buyer buyer) async {
    Uint8List im = await pickImage(ImageSource.gallery);
    String tempProfileURL = await StorageMethods()
        .uploadImageToStorage("profilePic", im, false, null);
    setState(() {
      profileURL = tempProfileURL;
      AuthMethods()
          .changeState("users", "profileURL", profileURL!, buyer.getData());
    });
  }
}
