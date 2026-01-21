import 'package:flutter/material.dart';
import 'package:test_app/bottom_navbar.dart';
import 'package:test_app/test_center.dart';

import '../ProfileScreen/profile_page.dart';
import '../QOTD/question_of_the_day.dart';
import 'home_icons_column.dart';
import 'home_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const ProfilePage();
                },
              ),
            );
          },
          icon: const Icon(Icons.menu, size: 60),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello,Vaibhav Madaan!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeIconsColumn(
                  icon: Icons.book,
                  label: 'Courses',
                  onPressed: () {},
                ),
                HomeIconsColumn(
                  icon: Icons.question_mark,
                  label: 'Question Bank',
                  onPressed: () {},
                ),
                HomeIconsColumn(
                  icon: Icons.all_inbox,
                  label: 'Packages',
                  onPressed: () {},
                ),
                HomeIconsColumn(
                  icon: Icons.newspaper,
                  label: 'Unsolved Papers',
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const QuestionOfTheDay();
                        },
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                  ),
                  icon: const Icon(
                    Icons.lightbulb_outline,
                    size: 30,
                    color: Colors.black,
                  ),
                  label: const Text(
                    "Question of the day",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView(
                children: [
                  const HomeList(
                    imagePath: 'assets/images/dips.jpg',
                    label: 'Latest Packages',
                  ),
                  Card(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "Test center",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TestCenter(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "View All >>",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 105,
                              child: ListView.builder(
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 0,
                                    color: Colors.grey[100],
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: ListTile(
                                      leading: SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                color: Colors.orange,
                                                alignment: Alignment.center,
                                                child: const Text(
                                                  "TEST ID",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                color: Colors.grey,
                                                alignment: Alignment.center,
                                                child: Text(
                                                  '963${index + 1}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      title: Text("Mock Test ${index + 1}"),
                                      subtitle: const Text(
                                        "Duration: 1 Hr • 50 Marks",
                                      ),
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                      ),
                                      onTap: () {},
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const HomeList(
                    imagePath: 'assets/images/dips.jpg',
                    label: 'Latest Packages',
                  ),
                  const HomeList(
                    imagePath: 'assets/images/dips.jpg',
                    label: 'Latest Packages',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
