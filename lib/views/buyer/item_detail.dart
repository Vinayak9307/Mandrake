import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:mandrake/utils/global_colors.dart';
import 'package:mandrake/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../firebase_resources/firestore_methods.dart';
import '../../model/buyer.dart';
import '../../model/order.dart';

class ItemDetail extends StatefulWidget {
  final snap;
  const ItemDetail({super.key, this.snap});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  bool isLoading = false;
  placeorder(buyer, context) async {
    setState(() {
      isLoading = true;
    });
    String res = await FirestoreMethods().placeOrder(
        order: OrderItem(
      buyerId: FirebaseAuth.instance.currentUser!.uid,
      sellerId: widget.snap['sellerId'],
      buyerAddress: buyer.address,
      sellerInfo: widget.snap['sellerInfo'],
      itemName: widget.snap['itemName'],
      completed: false,
    ));
    setState(() {
      showSnackBar(context, res);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    print(buyer.address);
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
                    image: NetworkImage(widget.snap['profileURL']),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          DefaultTextStyle(
            style: TextStyle(color: Colors.black, fontSize: 30),
            child: Text(widget.snap['itemName']!),
          ),
          SizedBox(
            height: size.height * 0.2,
            width: size.width,
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.black, fontSize: 20),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    widget.snap['description']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    GlobalColor.mainColor, //background color of button
                //border width and color
                elevation: 3, //elevation of button
                shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30)),
                //content padding inside button
              ),
              onPressed: () {
                placeorder(buyer, context);
              },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text(
                      'BUY',
                      style: TextStyle(fontSize: 25),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
