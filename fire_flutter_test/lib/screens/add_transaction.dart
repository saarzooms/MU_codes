import 'package:flutter/material.dart';

import '../services/firebase_operations.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController descController = TextEditingController();
  TextEditingController amntController = TextEditingController();
  TextEditingController dtController = TextEditingController();
  bool isExpense = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: descController,
          decoration: InputDecoration(labelText: 'Description'),
        ),
        TextField(
          controller: amntController,
          decoration: InputDecoration(labelText: 'Amount'),
        ),
        Row(
          children: [
            Text('Income'),
            Switch(value: isExpense, onChanged: (v) {}),
            Text('Expense'),
          ],
        ),
        TextField(
          controller: dtController,
          decoration: InputDecoration(
            labelText: 'Date Time',
            suffix: IconButton(
              onPressed: () {
                DatePickerDialog(
                  initialEntryMode: DatePickerEntryMode.calendarOnly,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                );
              },
              icon: Icon(Icons.calendar_month),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            FirebaseOperations.addTransction();
          },
          child: Text('Save Data'),
        ),
      ],
    ));
  }
}
