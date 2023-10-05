import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_controller.dart';

class AddContactScreen extends StatelessWidget {
  AddContactScreen({super.key});
  ContactController controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add your contact')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                  controller: controller.name,
                  decoration: InputDecoration(
                    labelText: 'Enter Name',
                  )),
              TextField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    labelText: 'Enter Email Id',
                  )),
              TextField(
                  controller: controller.mobile,
                  decoration: InputDecoration(
                    labelText: 'Enter Mobile Number',
                  )),
              ElevatedButton(
                onPressed: () {
                  controller.addContact();
                  Get.back();
                },
                child: Text('Add Contact'),
              ),
            ],
          ),
        ));
  }
}
