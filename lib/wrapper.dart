import 'package:flutter/material.dart';
import 'package:gymmanagement/Home/home.dart';
import 'package:gymmanagement/Services/auth_service.dart';
import 'package:gymmanagement/dialogs/loading.dart';
import 'package:gymmanagement/login/login.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().getAuthChange,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Home();
        } else {
          return Login();
        }
      },
    );
  }
}
