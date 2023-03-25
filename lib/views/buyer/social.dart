import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandrake/utils/global_colors.dart';

import 'user_post_card.dart';

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    final total_posts = [
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
      "1",
    ];
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: total_posts.length,
        itemBuilder: ((context, index) {
          return UserPostCard();
        }),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: GlobalColor.mainColor,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.add_box_outlined,size: 30,)),
          )
          ],
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        )
    );
  }
}
