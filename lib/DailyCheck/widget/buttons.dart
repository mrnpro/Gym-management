import 'package:flutter/material.dart';
import 'package:gymmanagement/Navigator/navigate.dart';

import '../../constants.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.size,
    this.text,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: kprimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: kslight,
      ),
      onPressed: onPressed,
      child: Center(
          child: SizedBox(
              width: size.width / 2.6,
              height: 100,
              child: Center(child: Text(text)))),
    );
  }
}
