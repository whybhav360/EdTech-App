import 'package:flutter/material.dart';
import 'package:test_app/HomeScreen/home_screen.dart';
import 'package:test_app/ProfileScreen/profile_page.dart';
import 'package:test_app/QOTD/question_of_the_day.dart';
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