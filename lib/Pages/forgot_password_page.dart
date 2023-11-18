// ignore_for_file: sort_child_properties_last, unused_catch_clause, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailcontroller.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Enter your email and we will send password reset link',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(width: 3.0, color: Colors.blue),
                ),
                // ignore: require_trailing_commas
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 3.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter Email',
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.pink),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: passwordReset,
              child: Text(
                'Reset Password',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              color: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
