import 'package:flutter/material.dart';
import 'package:gymmanagement/constants.dart';
import 'package:lottie/lottie.dart';

class Loading {
  static show(
    BuildContext context,
  ) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: kwhite, borderRadius: BorderRadius.circular(20)),
                child: Lottie.asset("assets/lottie/loading.json"),
              ),
            ));
  }
}
