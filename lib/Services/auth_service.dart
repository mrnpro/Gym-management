import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gymmanagement/Home/home.dart';
import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/constants.dart';
import 'package:gymmanagement/dialogs/loading.dart';
import 'package:gymmanagement/login/login.dart';
import 'package:lottie/lottie.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  get getUser => _auth.currentUser;
  get getAuthChange => _auth.authStateChanges();
  signIn(email, password, BuildContext context) async {
    try {
      Loading.show(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: e.code);
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      //Navigate.neverReturn(context, Login());
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.code);
    }
  }
}
