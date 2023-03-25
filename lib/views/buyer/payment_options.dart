import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandrake/model/order.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:mandrake/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:upi_india/upi_india.dart';
import 'package:upi_india/upi_response.dart';

import '../../firebase_resources/firestore_methods.dart';
import '../../model/buyer.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key, this.snap});
  final snap;
  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: "srivastavaprashant829@okaxis",
      receiverName: 'Prashant Srivastava',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: double.parse(widget.snap['price'].toString()),
    );
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (apps!.length == 0) {
      return Center(
        child: Text(
          "No apps found to handle transaction.",
          style: header,
        ),
      );
    } else {
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>((UpiApp app) {
              return GestureDetector(
                onTap: () {
                  _transaction = initiateTransaction(app);
                  setState(() {});
                },
                child: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.memory(
                        app.icon,
                        height: 60,
                        width: 60,
                      ),
                      Text(app.name),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      );
    }
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  Future<void> _checkTxnStatus(String status, Buyer buyer) async {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        showSnackBar(context, 'Your order is placed successfully.');
        break;
      case UpiPaymentStatus.SUBMITTED:
        showSnackBar(context, 'Transaction Submitted');
        await FirestoreMethods().placeOrder(
            order: OrderItem(
          buyerId: FirebaseAuth.instance.currentUser!.uid,
          sellerId: widget.snap['sellerId'],
          buyerAddress: buyer.address,
          sellerInfo: widget.snap['sellerInfo'],
          itemName: widget.snap['itemName'],
          completed: false,
        ));
        break;
      case UpiPaymentStatus.FAILURE:
        showSnackBar(context, 'Transaction Failed');
        await FirestoreMethods().placeOrder(
            order: OrderItem(
          buyerId: FirebaseAuth.instance.currentUser!.uid,
          sellerId: widget.snap['sellerId'],
          buyerAddress: buyer.address,
          sellerInfo: widget.snap['sellerInfo'],
          itemName: widget.snap['itemName'],
          completed: false,
        ));
        break;
      default:
        showSnackBar(context, 'Received an Unknown transaction status');
    }
    await FirestoreMethods().placeOrder(
        order: OrderItem(
      buyerId: FirebaseAuth.instance.currentUser!.uid,
      sellerId: widget.snap['sellerId'],
      buyerAddress: buyer.address,
      sellerInfo: widget.snap['sellerInfo'],
      itemName: widget.snap['itemName'],
      completed: false,
    ));
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Buyer buyer = Provider.of<BuyerProvider>(context).getBuyer;
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder:
                  (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                        style: header,
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String resCode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                  _checkTxnStatus(status, buyer);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTransactionData('Transaction Id', txnId),
                        displayTransactionData('Response Code', resCode),
                        displayTransactionData('Reference Id', txnRef),
                        displayTransactionData('Status', status.toUpperCase()),
                        displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
