import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandrake/utils/global_colors.dart';

import '../../utils/global_colors.dart';
import '../../utils/global_colors.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: size.height * 0.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(63),
                  bottomRight: Radius.circular(63),
                ),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 40,
                      color: GlobalColor.mainColor.withOpacity(1))
                ],
                color: GlobalColor.mainColor,
                image: DecorationImage(
                    image: AssetImage("assets/images/img.png"))),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          const DefaultTextStyle(
            style: TextStyle(color: Colors.black, fontSize: 30),
            child: Text('PlantName'),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: const DefaultTextStyle(
              style: TextStyle(color: Colors.black, fontSize: 20),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    "Description that is too long in text format",
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width*0.8,
            height: 40,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                primary: GlobalColor.mainColor, //background color of button
                 //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
                //content padding inside button
              ),
              onPressed: (){},
              child: const Text('BUY',style: TextStyle(fontSize: 25),),
            ),
          )
        ],
      ),
    );
  }
}
