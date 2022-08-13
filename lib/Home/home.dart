import 'package:flutter/material.dart';
import 'package:gymmanagement/CustomersList/lists.dart';
import 'package:gymmanagement/DailyCheck/daily_check.dart';
import 'package:gymmanagement/Home/widget/buttons.dart';
import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/Register/register.dart';

import '../constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      onPressed: () {
                        Navigate.preferReturn(context, const DailyCheck());
                      },
                      size: size,
                      text: "daily check",
                    ),
                    Button(
                      onPressed: () {},
                      size: size,
                      text: "12 didn't pay",
                    )
                  ],
                ),
                ksize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      onPressed: () {
                        Navigate.neverReturn(
                            context, Lists(appbartext: "total Customers"));
                      },
                      size: size,
                      text: "12 total customers",
                    ),
                    Button(
                      onPressed: () {},
                      size: size,
                      text: "12 are on warining ",
                    ),
                  ],
                ),
                ksize,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      onPressed: () {
                        Navigate.preferReturn(context, RegisterCustomer());
                      },
                      size: size,
                      text: "add new customers",
                    ),
                    Button(
                      onPressed: () {},
                      size: size,
                      text: "account",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
