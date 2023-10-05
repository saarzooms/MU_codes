import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/contact_model.dart';

class ContactController extends GetxController {
  RxList<Contact> contactList = RxList.empty();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  addContact() {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        mobile.text.isNotEmpty) {
      contactList.add(
        Contact(name.text, email.text, mobile.text),
      );
      name.clear();
      email.clear();
      mobile.clear();
    }
  }
}
