import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../views/seller/catalogue_item_detail.dart';
import 'global_colors.dart';

class CatalogueCard extends StatelessWidget {
  const CatalogueCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.35,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CatalogueItemDetail()));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: GlobalColor.mainColor.withOpacity(0.23),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: const Text(
                      'Species name',
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 - 60,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Image.asset(
                  "assets/images/img.png",
                  fit: BoxFit.fill,
                ),
              ),
              
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: GlobalColor.mainColor.withOpacity(0.23),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Row(
                  children: <Widget>[
                    const Text(
                      'Quantity-10',
                      style: TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      'Price-100',
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
      ),
    );
  ;
  }
}