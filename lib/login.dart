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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color.fromARGB(255, 2, 39, 72),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assest/login.png'),
                  radius: 100,
                  backgroundColor: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.white),
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
                    SizedBox(height: 30),
                    SizedBox(
                      width: 120,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(onPressed: () {}, child: Text("Sign Up")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
