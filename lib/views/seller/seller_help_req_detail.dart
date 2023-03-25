import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mandrake/utils/global_colors.dart';

class HelpCardDetailView extends StatelessWidget {
  const HelpCardDetailView({
    super.key,
    // required this.snap,
  });
  //final snap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: GlobalColor.mainColor,
        title: const Text('Query Detail',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(height: 10),
                  const Text(
                    "Posted by -  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    '  ' + "snap['email']",
                    //"prashant.2022ca067@mnnit,ac.in",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text(
                    "Posted on  -  ",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      color: Color.fromARGB(255, 78, 76, 76),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        '  ' +
                            "DateFormat.yMMMd().format(['filingTime'].toDate(),)",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 76, 76),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        " in ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 76, 76),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "snap['hostel']",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 76, 76),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Description",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 22,
                        color: Color.fromARGB(255, 78, 76, 76),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "snap['description'].substring(0, min((snap['description'] as String).length, 40))",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 52, 51, 51),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.015,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // for (var item in snap['images'])
              //   Padding(
              //     padding: const EdgeInsets.all(13.0),
              //     child: SizedBox(child: Image.memory(bytes)),
              //   ),
              const SizedBox(
                height: 20,
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
                          "Decline",
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
                          "Accept",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
