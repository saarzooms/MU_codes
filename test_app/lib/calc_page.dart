import 'dart:developer';

import 'package:flutter/material.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  TextEditingController numOne = TextEditingController();
  TextEditingController numTwo = TextEditingController();
  int result = 0;
  @override
  Widget build(BuildContext context) {
    log('from build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: numOne,
            decoration: InputDecoration(
              labelText: 'Number 1',
              hintText: 'Enter any number',
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: numTwo,
            decoration: InputDecoration(
              labelText: 'Number 2',
              hintText: 'Enter any number',
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  result = int.parse(numOne.text) + int.parse(numTwo.text);
                  log('result $result');
                  setState(() {});
                },
                child: Text(
                  '+',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '-',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '*',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  result = int.parse(numOne.text) ~/ int.parse(numTwo.text);
                  log('result $result');
                  setState(() {});
                },
                child: Text(
                  '/',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          Text(
            'Result: $result',
            style: TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
