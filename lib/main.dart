import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:htetmgblog/Auth/main_page.dart';
import 'package:htetmgblog/firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MainPage(),
    );
  }
}