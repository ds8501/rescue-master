import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/login.dart';

class logo_Screen extends StatefulWidget {
  const logo_Screen({Key? key}) : super(key: key);

  @override
  State<logo_Screen> createState() => _logo_ScreenState();
}

class _logo_ScreenState extends State<logo_Screen> {
  @override
  void initState() {
    intro();
    super.initState();
  }

  void intro() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("assest/login.png"),
          ),
        ),
      ),
    );
  }
}
