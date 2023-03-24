import 'package:flutter/material.dart';
import 'package:mandrake/providers/buyer_provider.dart';
import 'package:mandrake/views/buyer/signup_view.dart';
import 'package:provider/provider.dart';
import '../../firebase_resources/auth_methods.dart';
import '../../utils/button_global.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';
import 'nav_bar.dart';

class BuyerLoginView extends StatefulWidget {
  const BuyerLoginView({super.key});

  @override
  State<BuyerLoginView> createState() => _BuyerLoginViewState();
}

class _BuyerLoginViewState extends State<BuyerLoginView> {
  String? email = "";
  String? password = "";

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: email!,
      password: password!,
    );
    // ignore: use_build_context_synchronously
    BuyerProvider buyerProvider = Provider.of(context, listen: false);
    await buyerProvider.refreshUser();
    setState(() {
      isLoading = false;
    });
    if (res != "Log In Success") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      print("go to feed");
      //ignore: use_build_context_synchronously
      Navigator.pop(context, '/onBoard');

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavBar()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => {
          FocusScope.of(context).requestFocus(
            FocusNode(),
          ),
        },
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              //color: Colors.black,
              //width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 65,
                  ),
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
                    "Login to your account",
                    style: TextStyle(
                      color: GlobalColor.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
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
                    height: 60,
                  ),
                  ButtonGlobal(
                    text: "Sign In",
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        loginUser();
                      }
                    },
                    isLoading: isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account ? ",
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BuyerSignUpView()),
                );
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: GlobalColor.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
