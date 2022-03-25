import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 1000) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Image.asset('note.png'),
                          ),
                          TextField(
                            controller: globals.username,
                            decoration: _inputDecoration('Username'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: TextField(
                              controller: globals.password,
                              decoration: _inputDecoration('Password'),
                            ),
                          ),
                          const SignupButton(),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Image.asset('note.png'),
                          ),
                          TextField(
                            controller: globals.username,
                            decoration: _inputDecoration('Username'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: TextField(
                              controller: globals.password,
                              decoration: _inputDecoration('Password'),
                            ),
                          ),
                          const SignupButton(),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: InkWell(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/login');
                },
                child: const Text(
                  'Already have an account? Login!',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 2,
                      color: Color(0xFF44527F),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: () {
        signup(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF44527F),
        ),
        child: const Text(
          'Sign Up!',
          style: TextStyle(
              fontSize: 25,
              letterSpacing: 2,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration(String text) {
  return InputDecoration(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
    hintText: text,
    contentPadding: const EdgeInsets.all(25.0),
  );
}

Future<void> signup(BuildContext context) async {
  var match = {
    "username": globals.username.text,
    "password": globals.password.text
  };

  var response = await http.post(
      Uri.parse('https://notes-backend-service.herokuapp.com/users'),
      headers: {"Accept": "*/*", "Content-Type": "application/json"},
      body: json.encode(match),
      encoding: Encoding.getByName("utf-8"));

  if (response.statusCode == 201) {
    Navigator.popAndPushNamed(context, '/login');
  } else if (response.statusCode == 409) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Username already exists. Try with a different one.'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error signing up. Try again.'),
      ),
    );
  }
}
