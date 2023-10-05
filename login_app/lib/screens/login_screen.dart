import 'package:flutter/material.dart';
import 'package:login_app/screens/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtUserController = TextEditingController();
  TextEditingController txtPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: txtUserController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: txtPassController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (txtUserController.text.isNotEmpty &&
                  txtPassController.text.isNotEmpty) {
                // Obtain shared preferences.
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setBool('isLogin', true);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Login successfully'),
                  ),
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DashboardScreen(),
                  ),
                );
              }
            },
            child: Text(
              'Login',
            ),
          ),
        ],
      ),
    ));
  }
}
