import 'package:flutter/material.dart';
import 'package:mandrake/firebase_resources/auth_methods.dart';

import '../../utils/global_colors.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  logOutUser() {
    AuthMethods().logoutUser();
  }

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
            children: const [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                // child: profileURL != null
                //     ? CircleAvatar(
                //         radius: 50,
                //         backgroundImage: NetworkImage(profileURL!),
                //       )
                child: CircleAvatar(
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
              SizedBox(
                height: 5,
              ),
              Text(
                "name",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "regNo",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "email",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ListTile(
          leading: const Icon(
            Icons.logout,
            size: 20,
          ),
          title: const Text(
            'Log Out',
            style: TextStyle(fontSize: 20),
          ),
          onTap: logOutUser,
        ),
      ],
    );
  }
}
