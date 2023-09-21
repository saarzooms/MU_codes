import 'package:flutter/material.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
      ),
      body: Column(
        children: [
          my_contact_card('Raj', '1478523698', 'E0001'),
          my_contact_card('Raju', '1478523658', 'E0002'),
          my_contact_card('Rajan', '1478523668', 'E0003'),
        ],
      ),
    );
  }

  my_contact_card(String name, String mono, String enroll) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 30),
          ),
          Text(
            mono,
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          Text(
            enroll,
            style: TextStyle(fontSize: 20, color: Colors.deepOrange),
          ),
        ],
      ),
    );
  }
}
