import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gymmanagement/dialogs/loading.dart';
import 'package:gymmanagement/models/customers/customers_model.dart';
import 'package:gymmanagement/models/customers/status_and_days_left_model.dart';
import 'package:image_picker/image_picker.dart';

class DbService {
  CollectionReference customers =
      FirebaseFirestore.instance.collection("Customers");
  CollectionReference statusAndDaysLeft =
      FirebaseFirestore.instance.collection("statusAndDaysLeft");

  Future addCustomer(CustomersModel model, BuildContext context) async {
    try {
      Loading.show(context);

      var result = await customers.add(
        model.toJson(),
      );
      //create a status days left and last active day before stop
      await createStatus(
          StatusAndDaysLeft(30, FieldValue.serverTimestamp(), "active"),
          result.id);
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "customer registered successfuly");
    } catch (e) {
      print(e.toString());
      Navigator.pop(context);
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  Future<String> imageupload(XFile? profileImg) async {
    String tmpImgName;

    // step one generate different id and assign to tempImageName
    tmpImgName = customers.doc().id;

    //step two upload to firebase storage
    await FirebaseStorage.instance
        .ref("profileImages/$tmpImgName")
        .putFile(File(profileImg!.path));

    //step3 download the uploaded url and store the url in the users profile
    return await FirebaseStorage.instance
        .ref("profileImages/$tmpImgName")
        .getDownloadURL();
  }

  Future createStatus(StatusAndDaysLeft model, id) async {
    try {
      await statusAndDaysLeft.doc(id).set(model.toJson());
    } catch (e) {
      print(e.toString());
    }
  }
}
