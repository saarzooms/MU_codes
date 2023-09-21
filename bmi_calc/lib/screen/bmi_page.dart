import 'dart:math';

import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({super.key});

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController wt = TextEditingController();
  TextEditingController ht = TextEditingController();
  var bmi = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: wt,
                decoration: InputDecoration(
                  labelText: 'Weight in Kg',
                ),
              ),
              TextField(
                controller: ht,
                decoration: InputDecoration(
                  labelText: 'Height in Meters',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  bmi = double.parse(wt.text) / pow(double.parse(ht.text), 2);
                  setState(() {});
                },
                child: Text('Calculate'),
              ),
              Text('BMI: $bmi'),
            ],
          ),
        ));
  }
}
