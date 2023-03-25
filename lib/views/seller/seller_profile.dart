import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../model/buyer.dart';
import '../../providers/buyer_provider.dart';
import '../../utils/utils.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({super.key});

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  String? profileURL = "";
  String mobileNo = "";
  String address = "";
  String accountNo = "";
  String ifscCode = "";
  String variety = "";
  String size = "";

  String tempmobileNo = "";
  String tempaddress = "";
  String tempaccountNo = "";
  String tempifscCode = "";
  String tempvariety = "";
  String tempsize = "";

  late TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
                      left: MediaQuery.of(context).size.width * 0.5 - 60,
                      // right: 0,
                      // top: 60,
                      bottom: 0,
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
              Text("seller.username!",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18)),
              //for spacing
              const SizedBox(
                height: 5,
              ),
              Text("seller.email!",
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 18)),

              //this row contains the buttons to see complaints filed and complaints resolved

              //for spacing
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Personal Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  subtitle: Text(mobileNo,
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
                height: 20,
              ),

              //this is a card which contains listtile of hostel
              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.home,
                    size: 30,
                  ),
                  subtitle: Text(address,
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
              const SizedBox(
                height: 30,
              ),
              Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Bank Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                    size: 30,
                  ),
                  subtitle: Text(accountNo,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text(
                    'Account No',
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(3);
                    },
                  ),
                ),
              ),

              //for spacing
              const SizedBox(
                height: 20,
              ),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                    size: 30,
                  ),
                  subtitle: Text(ifscCode,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text(
                    'ifsc code',
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(4);
                    },
                  ),
                ),
              ),

              //for spacing
              const SizedBox(
                height: 30,
              ),

              Container(
                  padding: EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Catalogue Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  )),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                    size: 30,
                  ),
                  subtitle: Text(variety,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text(
                    'Variety No',
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(5);
                    },
                  ),
                ),
              ),

              //for spacing
              const SizedBox(
                height: 20,
              ),

              Card(
                elevation: 5,
                child: ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                    size: 30,
                  ),
                  subtitle: Text(size,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  title: const Text(
                    'Size in hectares',
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.edit),
                    onTap: () async {
                      await _onEditPressed(6);
                    },
                  ),
                ),
              ),

              SizedBox(
                height: 30,
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
              ),
              const SizedBox(
                height: 30,
              ),
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
                // /
                title: flag == 1
                    ? Text("Mobile No.")
                    : (flag == 2
                        ? Text("Address")
                        : (flag == 3
                            ? Text("Account no.")
                            : (flag == 4
                                ? Text("IFSC Code")
                                : (flag == 5
                                    ? Text("Variety")
                                    : (flag == 6
                                        ? Text("Size of nursery(in hectares)")
                                        : null))))),
                //this is the text field for filling the new hostel name or Room no
                content: flag == 1
                    ? TextField(
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        decoration:
                            const InputDecoration(hintText: 'Enter mobile No.'),
                        controller: controller,
                        onChanged: (value) {
                          setState(() {
                            tempmobileNo = value;
                          });
                        },
                      )
                    : (flag == 2
                        ? TextField(
                            keyboardType: TextInputType.text,
                            autofocus: true,
                            decoration: const InputDecoration(
                                hintText: 'Enter Address'),
                            controller: controller,
                            onChanged: (value) {
                              setState(() {
                                tempaddress = value;
                              });
                            },
                          )
                        : (flag == 3
                            ? TextField(
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                decoration: const InputDecoration(
                                    hintText: 'Enter Account no.'),
                                controller: controller,
                                onChanged: (value) {
                                  setState(() {
                                    tempaccountNo = value;
                                  });
                                },
                              )
                            : (flag == 4
                                ? TextField(
                                    keyboardType: TextInputType.text,
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                        hintText: 'Enter IFSC'),
                                    controller: controller,
                                    onChanged: (value) {
                                      setState(() {
                                        tempifscCode = value;
                                      });
                                    },
                                  )
                                : (flag == 5
                                    ? TextField(
                                        keyboardType: TextInputType.number,
                                        autofocus: true,
                                        decoration: const InputDecoration(
                                            hintText: 'Enter variety(no.)'),
                                        controller: controller,
                                        onChanged: (value) {
                                          setState(() {
                                            tempvariety = value;
                                          });
                                        },
                                      )
                                    : (flag == 6
                                        ? TextField(
                                            keyboardType: TextInputType.number,
                                            autofocus: true,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Enter size of nursery'),
                                            controller: controller,
                                            onChanged: (value) {
                                              setState(() {
                                                tempsize = value;
                                              });
                                            },
                                          )
                                        : null))))),

                actions: [
                  TextButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      submit(flag);
                    },
                  ),
                ],
              ));

  void submit(var flag) {
    setState(() {
      if (flag == 1) {
        mobileNo = tempmobileNo;
      } else if (flag == 2) {
        address = tempaddress;
      } else if (flag == 3) {
        accountNo = tempaccountNo;
      } else if (flag == 4) {
        ifscCode = tempifscCode;
      } else if (flag == 5) {
        variety = tempvariety;
      } else {
        size = tempsize;
      }
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
