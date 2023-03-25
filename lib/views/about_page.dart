import 'package:flutter/material.dart';

import '../utils/global_colors.dart';
import '../utils/utils.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColor.mainColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "About Us",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                "Team",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 78, 76, 76),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CardView(
                profilePic: './assets/images/vinayak.jpg',
                qoute:
                    'Programs must be written for people to read, and only incidentally for machines to execute.',
                name: '- Vinayak Kushwaha',
                linkedInLink:
                    'https://www.linkedin.com/in/vinayak-kushwaha-bab9b5245/',
                gitHubLink: 'https://github.com/Vinayak9307',
                gmailLink: 'mailto:kushwahavinayak286@gmail.com',
              ),
              SizedBox(
                height: 20,
              ),
              CardView(
                profilePic: './assets/images/yash.jpg',
                qoute:
                    'Any fool can write code that a computer can understand. Good programmers write code that humans can understand.',
                name: '- Yash Pal Singh',
                linkedInLink:
                    'https://www.linkedin.com/in/yash-pal-singh-2a2034195/',
                gitHubLink: 'https://github.com/protonium71',
                gmailLink: 'mailto:ypsingh393.0@gmail.com',
              ),
              SizedBox(
                height: 20,
              ),
              CardView(
                profilePic: './assets/images/prashant.jpg',
                qoute:
                    'Always code as if the guy who ends up maintaining your code will be a violent psychopath who knows where you live.',
                name: '- Prashant Srivastava',
                linkedInLink:
                    'https://www.linkedin.com/in/prashant-srivastava-3ba2bb186/',
                gitHubLink: 'https://github.com/codor07?tab=repositories',
                gmailLink: 'mailto:srivastavaprashant829@gmail.com',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "The Idea Behind it ?",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 78, 76, 76),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                'In this fast-moving world with intensive coursework, students find very less time to share their problems.   At every university, the students reside in hostels or at home, and any and every problem related to college have offline complaint registration opening only 2-3 hours a day which some students miss.\nThis is the reason why Querium is here.',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 61, 61, 61),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
