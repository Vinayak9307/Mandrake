import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandrake/model/request.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../firebase_resources/firestore_methods.dart';
import '../../model/buyer.dart';
import '../../utils/button_global.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';
import '../drawer.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String? selectedCategory = '';
  String? title = '';
  String? description = '';
  final List<Uint8List> _imgList = [];
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void showImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      if (_imgList.isEmpty) {
        _imgList.add(im);
      } else {
        _imgList[0] = im;
      }
    });
  }

  void addRequest(user, images) async {
    setState(() {
      isLoading = true;
    });
    String res = "Some Error Occured";

    if (user!.address!.isNotEmpty) {
      String reqId = const Uuid().v1();

      res = await FirestoreMethods().addHelpRequest(
        request: Request(
            uid: user!.getData()['uid'],
            reqId: reqId,
            email: user!.getData()['email'],
            address: user!.getData()['address'],
            title: title!,
            description: description!,
            filingTime: DateTime.now(),
            images: [],
            name: user!.getData()['username'],
            accepted: false),
        images: _imgList,
      );
    } else {
      showSnackBar(context,
          "Please fill the address and room no details in profile section !");
    }

    print(res);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    return GestureDetector(
      onTap: () => {FocusScope.of(context).requestFocus(FocusNode())},
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            title: const Text("Ask for Help"),
            centerTitle: true,
            elevation: 0,
            backgroundColor: GlobalColor.mainColor,
            leading: IconButton(
              onPressed: () => _scaffoldKey.currentState!.openDrawer(),
              icon: SvgPicture.asset("assets/icons/menu.svg"),
            )),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Title",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Title can't be left empty.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        title = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add title",
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: 13, left: 8),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add details",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Details you think is important for others to know",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 109, 107, 107),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    minLines: 1,
                    maxLines: 4,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description can't be left empty.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        description = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add description",
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 159, 158, 158),
                          width: 1.1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.only(top: 13, left: 8),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Add photo",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Photos helps to best describe your post",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 109, 107, 107),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Color.fromRGBO(127, 128, 128, 1),
                      size: 40.0,
                    ),
                    color: Colors.blue,
                    onPressed: showImage,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  _imgList.isNotEmpty
                      // ? CircleAvatar(
                      //     radius: 64,
                      //     backgroundImage: MemoryImage(_imgList[0]),
                      //   )

                      ? Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SizedBox(
                            child: Image.memory(_imgList[0]),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonGlobal(
                    text: "Post",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        addRequest(buyer, _imgList);
                      }
                    },
                    isLoading: isLoading,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Drawerr(
                  snap: buyer.getData(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
