import 'package:flutter/material.dart';
import 'package:test_app/bottom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test app',

        debugShowCheckedModeBanner: false,
        home : const BottomNavbar(),
    );
  }
}