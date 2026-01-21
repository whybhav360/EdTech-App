import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/study_center.dart';
import 'package:test_app/test_center.dart';

import 'HomeScreen/home_screen.dart';
import 'doubt_hub.dart';
import 'help_center.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomeScreen(),
    TestCenter(),
    StudyCenter(),
    DoubtHub(),
    HelpCenter(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentPage, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/test-center.svg',
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
            label: 'Test Center',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/study-center.svg',
              width: 35,
              height: 35,
              fit: BoxFit.cover,
            ),
            label: 'Study Center',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/doubt-center.svg'),
            label: 'Doubt\'s Hub',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/help-desk.svg',
              width: 35,
              height: 38,
              fit: BoxFit.cover,
            ),
            label: 'Help me',
          ),
        ],
      ),
    );
  }
}
