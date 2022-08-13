import 'package:flutter/material.dart';
import 'package:gymmanagement/DailyCheck/widget/buttons.dart';
import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/Scanner/qrscan.dart';

import '../constants.dart';

class DailyCheck extends StatelessWidget {
  const DailyCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Choose"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                    onPressed: () {
                      Navigate.preferReturn(context, QrScan());
                    },
                    size: size,
                    text: "QR Code",
                  ),
                  Button(
                    onPressed: () {},
                    size: size,
                    text: "ID",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
