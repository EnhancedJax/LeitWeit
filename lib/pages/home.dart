import 'package:flutter/material.dart';
import 'package:lietweit/widgets/button_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Hi User, ready for another workout?',
                      style: Theme.of(context).textTheme.headlineLarge,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                  const ButtonIcon(icon: Icons.stacked_line_chart_rounded)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
