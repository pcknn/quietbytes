import 'package:flutter/material.dart';
import 'features/login.dart';
import 'features/signup.dart';
import 'features/welcome.dart';
import 'features/test.dart';
import 'features/blank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/test',
      routes: {
        '/test': (context) => const Test(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
        '/blank': (context) => const Blank(),
      },
    );
  }
}
