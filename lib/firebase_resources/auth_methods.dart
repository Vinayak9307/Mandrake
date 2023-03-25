import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mandrake/model/buyer.dart';
import 'package:mandrake/model/seller.dart';

class AuthMethods {
  //Instance of firebase authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<dynamic> getUserDetails(String collection) async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snapshot =
        await _firestore.collection(collection).doc(currentUser.uid).get();
    if (collection == 'users') {
      return Buyer.getUser(snapshot);
    }
    return Seller.getUser(snapshot);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String phoneNo,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phoneNo.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        Buyer user = Buyer(
          username: username,
          email: email,
          uid: cred.user!.uid,
          phoneNo: phoneNo,
          orders: "0",
          cart: "0",
          posts: [],
          address: "",
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.getData());
        await _firestore
            .collection('type')
            .doc(cred.user!.uid)
            .set({'type': "user"});
      }
      res = "Sign Up Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> signUpSeller({
    required String email,
    required String password,
    required String username,
    required String phoneNo,
    required String accountNo,
    required String address,
    required String bankName,
    required String ifscCode,
    required int variety,
    required int sizeOfNursery,
    required String country,
    required String state,
    required String city,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          phoneNo.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        Seller user = Seller(
          uid: cred.user!.uid,
          username: username,
          profileURL: "",
          email: email,
          phoneNo: phoneNo,
          address: "",
          pendingOrders: [],
          completedOrders: [],
          bankAccountNumber: accountNo,
          bankName: bankName,
          ifscCode: ifscCode,
          variety: variety,
          sizeOfNursery: sizeOfNursery,
          catalog: [],
          approved: false,
        );

        await _firestore
            .collection('seller')
            .doc(cred.user!.uid)
            .set(user.getData());
        await _firestore
            .collection('type')
            .doc(cred.user!.uid)
            .set({'type': "seller"});
      }
      res = "Sign Up Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some Error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "Log In Success";
      } else {
        res = "Enter email and password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> logoutUser() async {
    String res = "Some Error Occured";
    try {
      await _auth.signOut();
      res = "Log Out Success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> changeState(String collection, String key, dynamic value,
      Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore.collection(collection).doc(userMap['uid']).set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }
    print(res);
    return res;
  }

  loginAdmin({required String email, required String password}) async {
    String res = "Some Error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "Log In Success";
      } else {
        res = "Enter email and password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
