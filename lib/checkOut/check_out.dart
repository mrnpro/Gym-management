import 'package:flutter/material.dart';
import 'package:gymmanagement/Home/home.dart';

import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/Scanner/qrscan.dart';

import '../constants.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigate.neverReturn(context, Home());
                          },
                          icon: Icon(Icons.arrow_back)),
                      Text(
                        "Checkout",
                        style: TextStyle(fontSize: 30),
                      ),
                      ksize,
                      ksize
                    ],
                  ),
                  const CircleAvatar(radius: 100),
                  ksize,
                  Container(
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ksecondary,
                    ),
                    child: Center(child: Text("Natnael Fikadu")),
                  ),
                  ksize,
                  Container(
                    width: size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ksecondary,
                    ),
                    child: Center(child: Text("20days left")),
                  ),
                  ksize,
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: kprimary,
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      backgroundColor: kslight,
                    ),
                    onPressed: () {},
                    child: const Center(child: Text("checkout")),
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
