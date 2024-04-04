import 'package:flutter/material.dart';
import 'package:lietweit/pages/testpage2.dart';

class TestPage1 extends StatelessWidget {
  const TestPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TestPage2()),
            );
          },
        ),
      ),
    );
  }
}
