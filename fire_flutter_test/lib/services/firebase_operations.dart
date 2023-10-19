import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class FirebaseOperations {
  static addTransction(String desc, int amnt, String type) {
    String resp = '';
    final transaction = <String, dynamic>{
      "amount": amnt,
      "description": desc,
      "type": type,
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

  static Stream<QuerySnapshot> fetchTransactions() {
    CollectionReference transaction = db.collection("transactions");
    return transaction.snapshots();
  }

  static deleteTranscation(String id) {
    String resp = '';
    DocumentReference docRef = db.collection("transactions").doc(id);

    docRef.delete().whenComplete(() {
      resp = 'Transaction deleted successfully';
    });
    return resp;
  }
}
