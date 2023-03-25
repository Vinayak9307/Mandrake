import 'package:flutter/material.dart';
import 'package:mandrake/views/seller/seller_login_view.dart';

import '../../firebase_resources/auth_methods.dart';
import '../../utils/button_global.dart';
import '../../utils/global_colors.dart';
import '../../utils/utils.dart';

class SellerSignUpView extends StatefulWidget {
  const SellerSignUpView({super.key});

  @override
  State<SellerSignUpView> createState() => _SellerSignUpViewState();
}

class _SellerSignUpViewState extends State<SellerSignUpView> {
  String? email = "";
  String? username = "";
  String? phoneNo = "";
  String? address = "";
  String? bankName = "";
  String? ifscCode = "";
  String? accountNo = "";
  int? variety;
  int? sizeOfNursery;
  String? password = "";
  String? confirmPassword = "";

  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signUpSeller(
      email: email!,
      password: password!,
      username: username!,
      phoneNo: phoneNo!,
      address: address!,
      bankName: bankName!,
      ifscCode: ifscCode!,
      accountNo: accountNo!,
      variety: variety!,
      sizeOfNursery: sizeOfNursery!,
    );
    setState(() {
      isLoading = false;
    });
    if (res != "Requested") {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SellerLoginView()),
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
                  "Create your account : Seller",
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
                //Address Box
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Address can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.gps_fixed_outlined),
                    ),
                    hintText: "Address",
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
                //Bank Name
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Bank name can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      bankName = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.account_balance),
                    ),
                    hintText: "Name of Bank",
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
                //Account Number
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Account number can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      accountNo = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.account_balance_outlined),
                    ),
                    hintText: "Account No",
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
                //ifsc code
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "IFSC code can't be left empty.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      ifscCode = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.account_balance_wallet),
                    ),
                    hintText: "IFSC code",
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
                //Variety
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Variety can't be left empty.";
                    }
                    final number = num.tryParse(value);
                    if (number == null) {
                      return "Please enter a number.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      variety = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.numbers_outlined),
                    ),
                    hintText: "Variety of items",
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
                //size of nursery
                TextFormField(
                  minLines: 1,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Size can't be left empty.";
                    }
                    final number = num.tryParse(value);
                    if (number == null) {
                      return "Please enter a number.";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      sizeOfNursery = int.parse(value);
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Align(
                      heightFactor: 1.0,
                      widthFactor: 1.0,
                      child: Icon(Icons.format_size_outlined),
                    ),
                    hintText: "Size of Nursery (in metersq.)",
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
                //password
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
                //confirm password
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
                  text: "Request Sign Up",
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
