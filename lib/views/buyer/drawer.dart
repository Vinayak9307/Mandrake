import 'package:flutter/material.dart';
import 'package:mandrake/views/about_page.dart';

import '../../utils/global_colors.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: GlobalColor.mainColor,
          width: double.infinity,
          height: 250,
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                // child: profileURL != null
                //     ? CircleAvatar(
                //         radius: 50,
                //         backgroundImage: NetworkImage(profileURL!),
                //       )
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/images/index.png"),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(bottom: 10),
              //   height: 100,
              //   width: 100,
              //   decoration: const BoxDecoration(
              //     color: Color.fromARGB(31, 57, 106, 158),
              //     shape: BoxShape.circle,
              //     image: DecorationImage(
              //       image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/querium-40901.appspot.com/o/profilePic%2Fkgh87sQ6E2OlxbOiEzit1Bad5Mk1?alt=media&token=f8bad6d6-b15c-47eb-ad8f-72baee46e051"),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "name",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "regNo",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "email",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: const Icon(
            Icons.person_2_outlined,
            size: 20,
          ),
          title: const Text(
            'About us',
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            size: 20,
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(fontSize: 20),
          ),
          //onTap: logOutUser,
        ),
      ],
    );
  }
}