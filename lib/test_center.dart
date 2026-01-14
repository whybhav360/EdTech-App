import 'package:flutter/material.dart';

class TestCenter extends StatelessWidget {
  const TestCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Center'),
      ),
      body: const Center(
        child: Text('Test Center'),
      ),
    );
  }
}
