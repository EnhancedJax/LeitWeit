import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:LeitWeit/services/supabase.dart';

class ChooseExercisePage extends StatelessWidget {
  static const route = '/chooseexercise';
  ChooseExercisePage({super.key});

  final _future = supabase.from('Exercises').select('*');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Select Exercise'),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final exercises = snapshot.data!;
                debugPrint('exercises: $exercises');
                if (exercises.isEmpty) {
                  return const Center(child: Text('No exercises found'));
                }
                return Expanded(
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                      itemCount: exercises.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];

                        return ListTile(
                          // leading: const Placeholder(),
                          title: Text(exercise['name']),
                          subtitle: Text(exercise['primary_group']),
                          onTap: () {
                            context.pop(exercise);
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
