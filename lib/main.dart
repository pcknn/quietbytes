import 'package:flutter/material.dart';
import 'features/login.dart';
import 'features/signup.dart';
import 'features/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, 
    initialRoute: '/welcome',
    routes: {
      '/welcome': (context) => const Welcome(),
      '/login': (context) => Login(),
      '/signup': (context) => Signup(),
    },
    ); 
  }
}
