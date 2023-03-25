import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

//show SnackBar
void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

pickImage(ImageSource imageSource) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? xf = await imagePicker.pickImage(source: imageSource);

  if (xf != null) {
    return await xf.readAsBytes();
  }
}

class CardView extends StatelessWidget {
  const CardView(
      {super.key,
      required this.profilePic,
      required this.qoute,
      required this.name,
      required this.linkedInLink,
      required this.gitHubLink,
      required this.gmailLink});

  //final String url = "";
  final String profilePic;
  final String qoute;
  final String name;
  final String linkedInLink;
  final String gitHubLink;
  final String gmailLink;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 8.0, 8.0, 8.0),
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
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profilePic),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    qoute,
                    style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 90, 88, 88)),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                          onTap: () {
                            _launchUrl(linkedInLink);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 50,
                            height: 30,
                            child: SvgPicture.asset(
                              './assets/icons/linkedin-icon.svg',
                              semanticsLabel: 'LinkedIn Logo',
                            ),
                          )),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            _launchUrl(gitHubLink);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 50,
                            height: 30,
                            child: SvgPicture.asset(
                              './assets/icons/github.svg',
                              semanticsLabel: 'GitHub Logo',
                            ),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                          onTap: () {
                            _launchUrl(gmailLink);
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            width: 38,
                            height: 30,
                            child: SvgPicture.asset(
                              './assets/icons/google-gmail.svg',
                              semanticsLabel: 'Gmail Logo',
                            ),
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
