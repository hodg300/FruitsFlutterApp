import 'package:flutter/material.dart';
import 'home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit App',
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      home: const HomeScreen(),
    );
  }
}
