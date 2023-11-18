// ignore_for_file: prefer_interpolation_to_compose_strings, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Text('Login in as '+ user.email! ),
            SizedBox(height: 20,),
            MaterialButton(onPressed:(){
              FirebaseAuth.instance.signOut();
            },
            
            child: Text('Log out',style: TextStyle(color: Colors.white),),
            color: Colors.pink,),
          ],
        ),
      ),
    );
  }
}