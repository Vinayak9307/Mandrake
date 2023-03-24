import 'package:flutter/material.dart';

class TextFormGlobal extends StatefulWidget {
  const TextFormGlobal(
      {super.key,
      required this.controller,
      this.text,
      required this.textInputType,
      required this.obscure,
      this.icon});

  final TextEditingController controller;
  final String? text;
  final TextInputType textInputType;
  final bool obscure;
  final IconData? icon;

  @override
  State<TextFormGlobal> createState() => _TextFormGlobalState();
}

class _TextFormGlobalState extends State<TextFormGlobal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(top: 3, left: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.obscure,
        decoration: InputDecoration(
          prefixIcon: Align(
            heightFactor: 1.0,
            widthFactor: 1.0,
            child: Icon(widget.icon),
          ),
          hintText: widget.text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 13),
          hintStyle: const TextStyle(
            height: 1,
          )
        ),
      ),
    );
  }
}
