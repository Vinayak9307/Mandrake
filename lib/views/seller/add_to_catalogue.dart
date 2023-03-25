import 'dart:typed_data';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandrake/model/catalogue_item.dart';
import 'package:mandrake/providers/seller_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
// ignore: library_prefixes
// import '../buyer/drawer.dart' as Drawer;
import '../../firebase_resources/firestore_methods.dart';
import '../../model/seller.dart';
import '../../utils/button_global.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';

class AddCatalogue extends StatefulWidget {
  const AddCatalogue({super.key});

  @override
  State<AddCatalogue> createState() => _AddCatalogueState();
}

class _AddCatalogueState extends State<AddCatalogue> {
  String? selectedCategory = '';
  String? title = '';
  String? description = '';
  Uint8List? imgList;
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  int? count = 0;
  int? price = 0;

  void showImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      imgList = im;
    });
  }

  addCatalogue(user, images) async {
    setState(() {
      isLoading = true;
    });
    String res = "Some Error Occured";

    if (user!.address!.isNotEmpty) {
      String catId = const Uuid().v1();

      res = await FirestoreMethods().addCatalogue(
        catalogue: CatalogueItem(
          uid: catId,
          description: description,
          price: price,
          quantity: count,
          profileURL: "",
          sellerId: user!.uid,
          sellerInfo: user!.username,
          itemName: title,
        ),
        images: imgList!,
        seller: user,
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
    Seller seller = Provider.of<SellerProvider>(context).getseller;
    return GestureDetector(
      onTap: () => {FocusScope.of(context).requestFocus(FocusNode())},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalColor.mainColor,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            "Add to Catalogue",
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
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
                    "Specimen Name",
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
                      hintText: "Add name",
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
                    "Add count",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Count of the specimen you currently have",
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
                        return "Count can't be left empty.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        count = int.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add count",
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
                    "Add Price",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Rupees per specimen",
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
                        return "Count can't be left empty.";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        price = int.parse(value);
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Add Price",
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
                  imgList != null
                      ? Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: SizedBox(
                            child: Image.memory(imgList!),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 50,
                  ),
                  ButtonGlobal(
                    text: "Add Catalogue",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        addCatalogue(seller, imgList);
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
        drawer: const Drawer(),
      ),
    );
  }
}
