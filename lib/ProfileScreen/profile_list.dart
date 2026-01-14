import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final IconData leadingIcon;
  final String text;
  final VoidCallback action;
  const ProfileList({
    super.key,
    required this.leadingIcon,
    required this.text,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextButton(
        onPressed: () {
          action();
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Icon(leadingIcon, color: Colors.black, size: 24),

            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
