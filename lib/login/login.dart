import 'package:flutter/material.dart';
import 'package:gymmanagement/Home/home.dart';
import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/constants.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kprimary),
                  ),
                ),
                ksize,
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'username',
                          hintText: 'Enter your username',
                        ),
                      ),
                      ksize,
                      TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter Password',
                        ),
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
                        onPressed: () {
                          Navigate.neverReturn(context, Home());
                        },
                        child: const Center(child: Text("Login")),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
