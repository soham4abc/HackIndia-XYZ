import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
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
                      controller: _username,
                      decoration: _inputDecoration('Username'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextField(
                        controller: _password,
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
                      controller: _username,
                      decoration: _inputDecoration('Username'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextField(
                        controller: _password,
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
      onPressed: () {},
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

// Future<Map> login () {

// }
