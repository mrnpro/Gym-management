import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:gymmanagement/Navigator/navigate.dart';
import 'package:gymmanagement/Services/auth_service.dart';
import 'package:gymmanagement/Services/db_service.dart';
import 'package:gymmanagement/models/customers/customers_model.dart';
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

  Future generateId() async {
    var currentId;
    var id;

    try {
      await FirebaseFirestore.instance
          .collection("id")
          .doc("generated")
          .get()
          .then((value) {
        currentId = value;
      });
      id = currentId['current'];
      id++;
      await FirebaseFirestore.instance
          .collection("id")
          .doc("generated")
          .update({"current": id});
    } catch (e) {
      print(e);
    }
    return id++;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController age = TextEditingController();
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
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back)),
                      Text(
                        "ADD NEW",
                        style: TextStyle(fontSize: 30),
                      ),
                      ksize,
                      ksize
                    ],
                  ),
                  ksize,
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
                  Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullname,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter full name";
                                  }
                                },
                                //controller: name,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'enter your full name',
                                ),
                              ),
                              ksize,
                              TextFormField(
                                controller: age,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter age";
                                  }
                                },
                                keyboardType: TextInputType.number,
                                //controller: age,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'enter your age',
                                ),
                              ),
                              ksize,
                              TextFormField(
                                controller: phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter phone number";
                                  }
                                },
                                keyboardType: TextInputType.phone,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter your phone number',
                                ),
                              ),
                            ],
                          )),
                      ksize,
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: kprimary,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var id = await generateId();
                            String imageUrl =
                                await DbService().imageupload(image);
                            DbService().addCustomer(
                              CustomersModel(
                                  fullname.text.trim(),
                                  age.text.trim(),
                                  phone.text.trim(),
                                  FieldValue.serverTimestamp(),
                                  imageUrl,
                                  id.toString()),
                              context,
                            );
                          }
                        },
                        child: const Center(
                            child: Text(
                          "Register",
                          style: TextStyle(color: kwhite),
                        )),
                      )
                    ],
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
