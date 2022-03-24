import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'globals.dart' as globals;
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                          const LoginButton(),
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
                          const LoginButton(),
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
                  Navigator.popAndPushNamed(context, '/signup');
                },
                child: const Text(
                  'Don\'t have an account? Sign up!',
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

// 8910060330

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: () {
        login(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.02, horizontal: width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF44527F),
        ),
        child: const Text(
          'Login !',
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

Future<void> login(BuildContext context) async {
  var match = {
    "username": globals.username.text,
    "password": globals.password.text
  };

  var response = await http.post(
      Uri.parse('http://notes-backend-service.herokuapp.com/login'),
      headers: {"Accept": "*/*", "Content-Type": "application/json"},
      body: json.encode(match),
      encoding: Encoding.getByName("utf-8"));

  if (response.statusCode == 200) {
    var body = json.decode(response.body);
    var box = Hive.box('auth_status');
    box.put('auth_status', body["access_token"]);
    Navigator.popAndPushNamed(context, '/notes');
  } else if (response.statusCode == 403) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid credentials.'),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error logging in. Try again.'),
      ),
    );
  }
}
