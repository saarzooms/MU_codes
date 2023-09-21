import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unmController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  String msg = 'demo text';
  bool isVisible = false;
  bool isValidated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: unmController,
              decoration: const InputDecoration(
                label: Text('Username'),
              ),
            ),
            TextField(
              controller: pwdController,
              obscureText: !isVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                prefix: const Icon(Icons.key),
                suffix: IconButton(
                  onPressed: () {
                    isVisible = !isVisible;
                    setState(() {});
                  },
                  icon: Icon(
                    isVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print('from login button');
                if (unmController.text == pwdController.text) {
                  msg = 'Both are same';
                  isValidated = true;
                } else {
                  msg = 'Both are different';
                  isValidated = false;
                }
                print(msg);
                setState(() {});
              },
              child: const Text('Login'),
            ),
            Text(
              msg,
              style: TextStyle(
                color: isValidated ? Colors.purple : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
