import 'package:flutter/material.dart';
import 'package:gymmanagement/DailyCheck/daily_check.dart';

import '../constants.dart';

class Lists extends StatelessWidget {
  const Lists({Key? key, required this.appbartext, this.type})
      : super(key: key);
  final appbartext;
  final type;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appbartext),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
