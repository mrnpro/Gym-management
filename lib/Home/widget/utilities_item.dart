import 'package:flutter/material.dart';
import 'package:gymmanagement/Navigator/navigate.dart';

import '../../constants.dart';
import '../home.dart';

class UtilitiesItem extends StatelessWidget {
  const UtilitiesItem({
    Key? key,
    required this.size,
    this.text,
    required this.onPressed,
    this.icon,
  }) : super(key: key);

  final Size size;
  final text;
  final VoidCallback onPressed;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: kwhite,
      ),
      onPressed: onPressed,
      child: Center(
          child: SizedBox(
              width: size.width / 2.6,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(icon),
                  ),
                  ksize,
                  Center(child: Text(text)),
                ],
              ))),
    );
  }
}
