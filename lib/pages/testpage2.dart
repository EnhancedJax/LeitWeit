import 'package:flutter/material.dart';

class TestPage2 extends StatelessWidget {
  const TestPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: const Text('Go back'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
