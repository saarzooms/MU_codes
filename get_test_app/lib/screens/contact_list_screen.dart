import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/contact_controller.dart';
import 'add_contact_screen.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({super.key});
  ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: SafeArea(
        child: Container(
          child: Obx(
            () => ListView.builder(
              itemCount: controller.contactList.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('${controller.contactList[index].name}'),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${controller.contactList[index].mono}'),
                      Text('${controller.contactList[index].email}'),
                    ]),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddContactScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
