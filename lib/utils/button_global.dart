import 'package:flutter/material.dart';

import 'global_colors.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({
    super.key,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });

  final String text;
  final Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: GlobalColor.mainColor,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
              )
            ]),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
