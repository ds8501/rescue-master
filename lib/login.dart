import 'package:flutter/material.dart';
import 'package:rescue/screen/homescreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

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
      // appBar: AppBar(
      //   title: Text('Login Page'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 2, 39, 72),
          padding: EdgeInsets.fromLTRB(5, 100, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assest/login.png'),
                radius: 100,
                // backgroundColor: Color.fromARGB(13, 198, 193, 193),
              ),

              // Text(
              //   "Login",
              //   style: TextStyle(color: Colors.white, fontSize: 35),
              // ),
              // Text(
              //   "Please sign in to continue",
              //   style: TextStyle(color: Colors.white, fontSize: 15),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                  prefixIcon: Icon(
                    Icons.password_sharp,
                    color: Colors.white,
                  ),
                ),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),

              SizedBox(
                width: 120,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(onPressed: () {}, child: Text("Sign Up?")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
