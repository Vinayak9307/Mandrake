import 'package:flutter/material.dart';

class UserPostCard extends StatelessWidget {
  const UserPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      width: size.width * 0.8,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:10,left: 20,right: 20),
            child: Container(
              height: size.height * 0.05,
              width: double.infinity,
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.only(left:8.0),
                child: Text("username",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25),textAlign: TextAlign.left,),
              ),
              
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom:10,left: 20,right: 20),
            width: double.infinity,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                    color: Colors.white, offset: Offset(0, 5), blurRadius: 8.0)
              ],
              image: DecorationImage(
                  image: AssetImage("assets/images/image_1.png"),
                  fit: BoxFit.fitWidth),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                    onPressed: () {
                    }, icon: Icon(Icons.favorite_border)),
              ),
              Text("333")
            ],
          )
        ],
      ),
    );
  }
}
