import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Routine {
  String name;
  // Add other properties as needed

  Routine(this.name);
}

class ListRoutine extends StatefulWidget {
  const ListRoutine({super.key});
  @override
  State<ListRoutine> createState() => ListRoutineState();
}

class ListRoutineState extends State<ListRoutine> {
  final _future = Supabase.instance.client.from('Routines').select('*');

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder(
          future: _future,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final routines = snapshot.data!;
            if (routines.isEmpty) {
              return const Center(child: Text('No routines found'));
            }
            return Expanded(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: routines.length,
                  itemBuilder: (context, index) {
                    final routine = routines[index];
                    return Text(routine['name']);
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
