// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback ShowLoginPages;
  const RegisterPage({super.key, required this.ShowLoginPages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
   final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    super.dispose();
  }
   Future SignUp() async {
    if(confirmPassword()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailcontroller.text.trim(),
      password: _passwordcontroller.text.trim(),
    );
    }
  }
  bool confirmPassword(){
    if(_passwordcontroller.text.trim() == _confirmpasswordcontroller.text.trim()){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Sai Blog')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_android,
                size: 200,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Hello There",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Register below with your detail',
                style: TextStyle(fontSize: 20),
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
              TextField(
                controller: _passwordcontroller,
                obscureText: true,
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
                  hintText: 'Enter Password',
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.pink),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _confirmpasswordcontroller,
                obscureText: true,
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
                  hintText: 'Enter Confirm Password',
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.pink),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: SignUp,
                child: Container(
                  // ignore: sort_child_properties_last
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You\'re a member ', style: TextStyle(fontSize: 16),),
                  GestureDetector(
                    onTap: widget.ShowLoginPages,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.pink, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}