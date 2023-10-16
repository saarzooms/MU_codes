import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class FirebaseOperations {
  static addTransction() {
    String resp = '';
    final transaction = <String, dynamic>{
      "amount": 400,
      "description": "Book",
      "type": "expense",
      "tr_dt": DateTime.now().toString(),
    };
    db.collection("transactions").add(transaction).whenComplete(() {
      resp = 'Transaction added successfully';
    });
    //     .catchError((e) {
    //   resp = e.toString();
    // });
    return resp;
  }
}
