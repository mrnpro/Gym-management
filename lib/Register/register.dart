import 'dart:io';

import 'package:flutter/material.dart';

import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class RegisterCustomer extends StatefulWidget {
  RegisterCustomer({Key? key}) : super(key: key);

  @override
  State<RegisterCustomer> createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  final ImagePicker picker = ImagePicker();

  XFile? image;

  void openCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Choose"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      openCamera();
                    },
                    child: (image != null)
                        ? SizedBox(
                            width: size.width / 2,
                            child: Image.file(File(image!.path)),
                          )
                        : const CircleAvatar(
                            radius: 70,
                            child: Icon(Icons.camera),
                          ),
                  ),
                  ksize,
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          //controller: name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'full name',
                            hintText: 'enter your full name',
                          ),
                        ),
                        ksize,
                        TextFormField(
                          //controller: age,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'age',
                            hintText: 'enter your age',
                          ),
                        ),
                        ksize,
                        TextFormField(
                          //controller: password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'phone number',
                            hintText: 'Enter your phone number',
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
                            //  Navigate.neverReturn(context, Home());
                          },
                          child: const Center(child: Text("register")),
                        )
                      ],
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
