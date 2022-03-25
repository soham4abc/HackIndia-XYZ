import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '/screens/login.dart';
import '/screens/signup.dart';
import '/screens/notes.dart';
import 'screens/search_notes.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('auth_status');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/notes': (context) => const Notes(),
      },
      theme: ThemeData(
        splashColor: Colors.transparent,
        focusColor: const Color(0xFF44527F),
        primaryColor: const Color(0xFF44527F),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  startTime() async {
    var _duration = const Duration(seconds: 1);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (box.get('auth_status') == null) {
      Navigator.of(context).popAndPushNamed('/login');
    } else {
      Navigator.of(context).popAndPushNamed('/notes');
    }
  }

  late final Box box;

  @override
  void initState() {
    super.initState();
    startTime();
    // Future.delayed(Duration.zero, () {
    //   Navigator.pushNamed(context, '/login');
    // });
    box = Hive.box('auth_status');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
