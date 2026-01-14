import 'package:flutter/material.dart';
import 'package:test_app/ProfileScreen/profile_list.dart';
import 'package:test_app/QOTD/question_of_the_day.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PROFILE',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
        child: Column(
          children: [
            const Column(
              children: [
                Icon(Icons.person, size: 150),
                Text(
                  "Vaibhav Madaan",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(child: ListView(children: [
              ProfileList(leadingIcon: Icons.book, text: 'COURSES', action: () { }),
              ProfileList(leadingIcon: Icons.assistant_direction, text: 'FEE STATUS', action: () { }),
              ProfileList(leadingIcon: Icons.question_mark, text: 'QUESTION BANK', action: () { }),
              ProfileList(leadingIcon: Icons.all_inbox, text: 'PACKAGES', action: () { }),
              ProfileList(leadingIcon: Icons.newspaper, text: 'UNSOLVED PAPERS', action: () { }),
              ProfileList(
                leadingIcon: Icons.lightbulb_outline, 
                text: 'QUESTION OF THE DAY', 
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuestionOfTheDay()),
                  );
                }
              ),
              ProfileList(leadingIcon: Icons.settings, text: 'SETTINGS', action: () { }),
              ProfileList(leadingIcon: Icons.notifications, text: 'NOTIFICATIONS', action: () { }),
              ProfileList(leadingIcon: Icons.privacy_tip, text: 'PRIVACY POLICY', action: () { }),
              ProfileList(leadingIcon: Icons.share, text: 'SHARE', action: () { }),
              ProfileList(leadingIcon: Icons.star, text: 'RATE US', action: () { }),
              ProfileList(leadingIcon: Icons.feedback, text: 'FEEDBACK', action: () { }),
              ProfileList(leadingIcon: Icons.help_outline, text: 'HELP', action: () { }),
              ProfileList(leadingIcon: Icons.info_outline, text: 'ABOUT', action: () { }),
              ProfileList(leadingIcon: Icons.logout, text: 'LOGOUT', action: () { }),
            ])),
          ],
        ),
      ),
    );
  }
}
