import 'package:cloud_firestore/cloud_firestore.dart';

class DbService {
  CollectionReference customers =
      FirebaseFirestore.instance.collection("Customers");

  Future addCustomer() async {
    customers.add({});
  }
}
