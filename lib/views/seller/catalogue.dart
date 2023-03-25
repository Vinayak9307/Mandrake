import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/catalogue_card.dart';
import '../../utils/global_colors.dart';
class Catalogue extends StatelessWidget {
  const Catalogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder:(context,index){
          return CatalogueCard();
        }
        ),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: GlobalColor.mainColor,
        centerTitle: true,
        title: Text('Your Catalogue',),
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/menu.svg"),
        ));
  }
}