import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rescue/screen/homescreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final Color facebookColor = const Color(0xff39579A);
final Color googleColor = const Color(0xffDF4A32);

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  void _submitForm() {
    // TODO: Implement login logic
    print('Email: $_email');
    print('Password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Container(
        color: Color.fromARGB(13, 198, 193, 193),
        padding: EdgeInsets.fromLTRB(12, 2, 12, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 5,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assest/login.jpeg'),
              radius: 120,
              backgroundColor: Color.fromARGB(13, 198, 193, 193),
            ),
            SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text('Login'),
            ),
            TextButton(onPressed: () {}, child: Text("Sign Up?")),
            Row(
              children: [
                SizedBox(
                  width: 90,
                ),
                CustomWidgets.socialButtonCircle(
                    googleColor, FontAwesomeIcons.googlePlusG,
                    iconColor: Colors.white, onTap: () {}),
                SizedBox(
                  width: 30,
                ),
                CustomWidgets.socialButtonCircle(
                    facebookColor, FontAwesomeIcons.facebookF,
                    iconColor: Colors.white, onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomWidgets {
  static Widget socialButtonRect(title, color, icon, {Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }

  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }
}
