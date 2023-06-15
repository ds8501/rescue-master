import 'package:flutter/material.dart';
import 'package:rescue/dbhelper/mongodb.dart';
import 'package:rescue/login.dart';
import 'package:rescue/logoscreen.dart';
import 'package:rescue/screen/form_screen.dart';
import 'package:rescue/screen/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: logo_Screen(),
    );
  }
}
