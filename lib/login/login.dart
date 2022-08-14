import 'package:flutter/material.dart';
import 'package:gymmanagement/Home/home.dart';
import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/Services/auth_service.dart';
import 'package:gymmanagement/constants.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Lottie.asset('assets/lottie/warmupguy.json'),
                const Center(
                  child: Text(
                    "Admin Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kprimary),
                  ),
                ),
                ksize,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your email";
                          }
                          if (!value.contains("@") && !value.contains(".com")) {
                            return "please enter a valid email adress ";
                          }
                        },
                        controller: email,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your email',
                        ),
                      ),
                      ksize,
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please enter your password";
                          }
                          if (value.length < 8) {
                            return "password must be greater than 8 digit";
                          }
                        },
                        controller: password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your password',
                        ),
                      ),
                      ksize,
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: kprimary,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthService().signIn(email.text.trim(),
                                password.text.trim(), context);
                          }
                        },
                        child: const Center(
                            child: Text(
                          "LOGIN",
                          style: TextStyle(color: kwhite),
                        )),
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
