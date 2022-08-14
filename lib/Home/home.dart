import 'package:flutter/material.dart';
import 'package:gymmanagement/CustomersList/lists.dart';
import 'package:gymmanagement/DailyCheck/daily_check.dart';
import 'package:gymmanagement/Home/widget/utilities_item.dart';
import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/Register/register.dart';
import 'package:gymmanagement/Services/auth_service.dart';
import 'package:lottie/lottie.dart';

import '../Scanner/qrscan.dart';
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
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "welcome Natnael",
                                  style: TextStyle(
                                      color: kprimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21),
                                ),
                                IconButton(
                                    onPressed: () {
                                      AuthService().signOut();
                                    },
                                    icon: Icon(Icons.logout))
                              ],
                            ),
                            SizedBox(
                              height: size.height / 4,
                              child: Lottie.asset("assets/lottie/coach.json"),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          color: ksecondary,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        children: [
                          ksize,
                          const Center(
                            child: Text(
                              "Utilities",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          ksize,
                          ksize,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UtilitiesItem(
                                icon: Icons.qr_code,
                                onPressed: () {
                                  Navigate.preferReturn(context, QrScan());
                                },
                                size: size,
                                text: "daily check",
                              ),
                              UtilitiesItem(
                                icon: Icons.people,
                                onPressed: () {
                                  Navigate.neverReturn(context,
                                      const Lists(appbartext: "unpaid"));
                                },
                                size: size,
                                text: "12 didn't pay",
                              )
                            ],
                          ),
                          ksize,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UtilitiesItem(
                                icon: Icons.people,
                                onPressed: () {
                                  Navigate.neverReturn(
                                      context,
                                      const Lists(
                                          appbartext: "total Customers"));
                                },
                                size: size,
                                text: "12 total customers",
                              ),
                              UtilitiesItem(
                                icon: Icons.people,
                                onPressed: () {
                                  Navigate.neverReturn(
                                      context,
                                      const Lists(
                                          appbartext: "warning customers"));
                                },
                                size: size,
                                text: "12 are on warning ",
                              ),
                            ],
                          ),
                          ksize,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              UtilitiesItem(
                                icon: Icons.new_label,
                                onPressed: () {
                                  Navigate.preferReturn(
                                      context, RegisterCustomer());
                                },
                                size: size,
                                text: "add new customers",
                              ),
                              UtilitiesItem(
                                icon: Icons.settings,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
