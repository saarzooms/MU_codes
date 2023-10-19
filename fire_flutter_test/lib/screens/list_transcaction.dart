import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../services/firebase_operations.dart';

class ListTranscation extends StatefulWidget {
  const ListTranscation({super.key});

  @override
  State<ListTranscation> createState() => _ListTranscationState();
}

class _ListTranscationState extends State<ListTranscation> {
  Stream<QuerySnapshot> collection = FirebaseOperations.fetchTransactions();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Expenses'),
        ),
        body: StreamBuilder(
          stream: collection,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs
                    .map(
                      (e) => ListTile(
                        title: Text(e['description']),
                        subtitle: Text(e['amount'].toString()),
                        trailing: IconButton(
                          onPressed: () async {
                            var res =
                                await FirebaseOperations.deleteTranscation(
                                    e.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(res),
                              ),
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Container();
            }
          },
        )

        // ListView.builder(
        //   itemCount: 6,
        //   itemBuilder: (context, index) {
        //     return ListTile(
        //       title: Text('Description'),
        //     );
        //   },
        // ),
        );
  }
}
