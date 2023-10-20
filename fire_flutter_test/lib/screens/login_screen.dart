import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobileNo = TextEditingController();
  TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextField(
            controller: _mobileNo,
            decoration: InputDecoration(labelText: 'Mobile no'),
          ),
          TextField(
            controller: _otp,
            decoration: InputDecoration(labelText: 'OTP'),
          ),
          ElevatedButton(
            onPressed: () {
              authenticateUser();
            },
            child: Text('Send OTP'),
          ),
          ElevatedButton(
            onPressed: () {
              verifyOTP();
            },
            child: Text('Verify OTP'),
          ),
        ],
      ),
    ));
  }

  String verid = '';
  authenticateUser() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91 ${_mobileNo.text}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        log('from verfication completed');
        await FirebaseAuth.instance.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        log('from verfication failed');
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        log('from code sent');
        verid = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        log('from code auto retrival timeout');
      },
      timeout: const Duration(seconds: 60),
    );
  }

  verifyOTP() async {
    // Update the UI - wait for the user to enter the SMS code
    String smsCode = _otp.text;

    // Create a PhoneAuthCredential with the code
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verid, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
