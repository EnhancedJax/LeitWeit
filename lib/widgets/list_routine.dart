import 'package:flutter/material.dart';

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
  List<Routine> routines = [];

  void addRoutine(Routine routine) {
    setState(() {
      routines.add(routine);
    });
  }

  void editRoutine(int index, Routine newRoutine) {
    setState(() {
      routines[index] = newRoutine;
    });
  }

  void deleteRoutine(int index) {
    setState(() {
      routines.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: routines.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(routines[index].name),
          // Add more properties as needed
        );
      },
    );
  }
}
