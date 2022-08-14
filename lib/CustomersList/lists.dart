import 'package:flutter/material.dart';
import 'package:gymmanagement/DailyCheck/daily_check.dart';

import '../constants.dart';

class Lists extends StatelessWidget {
  const Lists({Key? key, required this.appbartext, this.type})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final appbartext;
  // ignore: prefer_typing_uninitialized_variables
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
            child: SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    // controller: password,
                    // obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      // labelText: 'Password',
                      hintText: 'search customer',
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          leading: Text("naty"),
                          title: Center(child: Text("checked")),
                          trailing: Text("12/22/33"),
                        ),
                      ),
                    ),
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
