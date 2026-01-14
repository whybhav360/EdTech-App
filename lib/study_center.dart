import 'package:flutter/material.dart';

class StudyCenter extends StatelessWidget {
  const StudyCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Hub'),
      ),
      body: const Center(
        child: Text('Study Hub'),
      ),
    );
  }
}
