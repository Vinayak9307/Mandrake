import 'package:flutter/material.dart';

import '../../firebase_resources/auth_methods.dart';
import '../../utils/button_global.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';
import 'login_view.dart';

class BuyerSignUpView extends StatefulWidget {
  const BuyerSignUpView({super.key});

  @override
  State<BuyerSignUpView> createState() => _BuyerSignUpViewState();
}

class _BuyerSignUpViewState extends State<BuyerSignUpView> {
  String? email = "";
  String? username = "";
  String? phoneNo = "";
  String? password = "";
  String? confirmPassword = "";

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: email!,
      password: password!,
      username: username!,
      phoneNo: phoneNo!,
    );
    setState(() {
      isLoading = false;
    });
    if (res != "Sign Up Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BuyerLoginView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    "Mandrake",
                    style: TextStyle(
                      color: GlobalColor.mainColor,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Create your account",
                  style: TextStyle(
                    color: GlobalColor.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //Email Box
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.person_2_outlined),
                    ),
                    hintText: "Username",
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 13, left: 8),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Registration number can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      phoneNo = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.phone_android_outlined),
                    ),
                    hintText: "Phone Number",
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 13, left: 8),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //Password Box
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.email_outlined),
                    ),
                    hintText: "Email",
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 13, left: 8),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                //Confirm Password Box
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.password_outlined),
                    ),
                    hintText: "Password",
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 13, left: 8),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.toString() != password) {
                      return "Password don't match";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.key_outlined),
                    ),
                    hintText: "Confirm Password",
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 159, 158, 158),
                        width: 1.1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(top: 13, left: 8),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ButtonGlobal(
                  text: "Sign Up",
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      signUpUser();
                    }
                  },
                  isLoading: isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
