import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
import 'package:mandrake/model/buyer.dart';

class AuthMethods {
  //Instance of firebase authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Buyer> getUserDetails(String collection) async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return Buyer.getUser(snapshot);
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

  Future<String> changeState(
      String key, String value, Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore.collection('users').doc(userMap['uid']).set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }
    print(res);
    return res;
  }

  Future<String> changeAdminState(
      String key, String value, Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore.collection('admin').doc(userMap['uid']).set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }

    print(res);
    return res;
  }

  Future<String> changeComplaintState(
      String key, dynamic value, Map<String, dynamic> userMap) async {
    String res = "Some Error Occured";
    try {
      userMap[key] = value;
      await _firestore
          .collection('complaints')
          .doc(userMap['compId'])
          .set(userMap);
      res = "Update Success";
    } catch (err) {
      res = err.toString();
    }
    print(res);
    return res;
  }
}
