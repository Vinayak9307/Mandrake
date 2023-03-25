import 'package:flutter/material.dart';

import '../views/buyer/item_detail.dart';
import 'global_colors.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context)=>const ItemDetail()
            )
          );
        },
        child: Column(
          children: <Widget>[
            Image.asset("assets/images/image_1.png"),
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: GlobalColor.mainColor.withOpacity(0.23),
                ),
              
              ],borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
              child: Row(
                children: <Widget>[
                  const Text(
                    'fsadf',
                    style: TextStyle(fontSize: 17),
                  ),
                  const Spacer(),
                  Text(
                    'gfg',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: GlobalColor.mainColor.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
