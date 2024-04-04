import 'package:flutter/material.dart';
import 'package:lietweit/widgets/button_icon.dart';
import 'package:lietweit/widgets/card_workout.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SizedBox(width: 16),
                  const ButtonIcon(Icons.stacked_line_chart_rounded),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Your Workouts',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              const CardWorkout(),
            ],
          ),
        ),
      ),
    );
  }
}
