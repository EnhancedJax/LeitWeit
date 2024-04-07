import 'dart:developer';

import 'package:LeitWeit/pages/chooseexercise.dart';
import 'package:LeitWeit/themedata.dart';
import 'package:flutter/material.dart';
import 'package:LeitWeit/services/supabase.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';

class NewRoutinePage extends StatefulWidget {
  const NewRoutinePage({super.key});
  static const route = '/newroutine';

  @override
  State<NewRoutinePage> createState() => _NewRoutinePageState();
}

class _NewRoutinePageState extends State<NewRoutinePage> {
  final _key = GlobalKey<ExpandableFabState>();
  final PageController controller = PageController(viewportFraction: 0.9);

  List<Widget> pages = [];
  String routineName = 'New Routine';

  void saveRoutine() async {
    List<Map<String, dynamic>> exercises = [];
    exercises = pages.map((e) {
      final exercise = e as ExerciseCard;
      return {
        'exercise_id': exercise.data['id'],
        'rest': exercise.data['rest'],
        'sets': exercise.data['sets']
      };
    }).toList();

    if (exercises.length == 0) {
      if (context.mounted)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Add exercises to save to your routine!')),
        );
      return;
    }

    routineName = (routineName == '' ? 'New Routine' : routineName);
    final response = (await supabase.from('Routines').insert([
      {'name': routineName, 'user_id': supabase.auth.currentUser!.id}
    ]).select('id'));
    final newRoutineId = response[0]['id'];
    log('newRoutineId: $newRoutineId |||  Exercises: $exercises');
    await supabase.from('routine_exercise').insert(exercises.map((exercise) {
          return {
            'routine_id': newRoutineId,
            'exercise_id': exercise['exercise_id'],
            'rest': exercise['rest'],
            'sets': exercise['sets']
          };
        }).toList());
    if (context.mounted)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$routineName added to your routines!')),
      );
    context.pop();
  }

  void addExercise() async {
    Object? data = await context.push(ChooseExercisePage.route);
    if (data == null) {
      if (context.mounted)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Cancelled')),
        );
      return;
    }
    int currentIndex = controller.page!.round();

    if (pages.length != 0) {
      currentIndex++; // Add after the current page
    } // else, add as first page

    data = (data as Map<String, dynamic>);
    data['rest'] = 120;
    data['sets'] = ["N"];

    setState(() {
      pages.insert(
        currentIndex,
        ExerciseCard(data: data as Map<String, dynamic>),
      );
    });

    if (pages.length == 1) {
      controller.jumpToPage(currentIndex + 1);
    } else {
      controller.jumpToPage(currentIndex);
    }
    debugPrint(
        'Addded Exercise at $currentIndex, now with ${pages.length} pages!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppTheme.border,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (pages.length > 0) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmation'),
                              content:
                                  Text('Are you sure you want to go back?'),
                              actions: [
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text('Yes'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    context.pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        context.pop();
                      }
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      initialValue: '',
                      decoration: InputDecoration(
                        hintText: 'New Routine',
                        hintStyle: Theme.of(context)
                            .appBarTheme
                            .titleTextStyle
                            ?.copyWith(
                              color: AppTheme.onSurface2,
                            ),
                        filled: false,
                        isDense: true,
                      ),
                      style: Theme.of(context).appBarTheme.titleTextStyle,
                      onChanged: (value) {
                        setState(() {
                          routineName = value;
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: saveRoutine,
                    icon: const Icon(Icons.save),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(children: [
          PageView(
            scrollDirection: Axis.horizontal,
            controller: controller,
            children: pages,
          ),
          if (pages.length == 0)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.toll,
                    size: 64,
                    color: AppTheme.onSurface2,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Add an exercise to get started!',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: addExercise,
          foregroundColor: AppTheme.onInverseSurface,
          backgroundColor: AppTheme.inverseSurface,
          child: const Icon(Icons.add),
        )
        // floatingActionButtonLocation: ExpandableFab.location,
        // floatingActionButton: ExpandableFab(
        //   key: _key,
        //   type: ExpandableFabType.up,
        //   overlayStyle: ExpandableFabOverlayStyle(
        //     blur: 5,
        //   ),
        //   openButtonBuilder: RotateFloatingActionButtonBuilder(
        //       child: const Icon(Icons.add),
        //       backgroundColor: AppTheme.inverseSurface,
        //       foregroundColor: AppTheme.onInverseSurface,
        //       fabSize: ExpandableFabSize.regular,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(AppTheme.borderRadius))),
        //   closeButtonBuilder: FloatingActionButtonBuilder(
        //     size: 48,
        //     builder: (BuildContext context, void Function()? onPressed,
        //         Animation<double> progress) {
        //       return IconButton(
        //         onPressed: addExercise,
        //         style: ButtonStyle(
        //           padding: MaterialStateProperty.all(
        //             const EdgeInsets.all(16),
        //           ),
        //           backgroundColor:
        //               MaterialStateProperty.all(AppTheme.inverseSurface),
        //           foregroundColor:
        //               MaterialStateProperty.all(AppTheme.onInverseSurface),
        //           shape: MaterialStateProperty.all(
        //             RoundedRectangleBorder(
        //               borderRadius:
        //                   BorderRadius.circular(AppTheme.borderRadius),
        //             ),
        //           ),
        //         ),
        //         icon: const Icon(
        //           Icons.playlist_add,
        //           size: 24,
        //         ),
        //       );
        //     },
        //   ),
        //   children: [
        //     FloatingActionButton.large(
        //       heroTag: null,
        //       child: const Icon(Icons.edit),
        //       onPressed: () {},
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         final state = _key.currentState;
        //         if (state != null) {
        //           debugPrint('isOpen:${state.isOpen}');
        //           state.toggle();
        //         }
        //       },
        //       icon: const Icon(
        //         Icons.share,
        //         size: 30,
        //       ),
        //     ),
        //   ],
        // )
        );
  }
}

class ExerciseCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const ExerciseCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondarySurface,
        borderRadius: BorderRadius.circular(AppTheme.borderRadius),
        border: Border.all(color: AppTheme.border, width: 2),
      ),
      child: Column(
        children: [
          Text(data['name']),
          const SizedBox(height: 16),
          const Text('Sets'),
          const SizedBox(height: 16),
          const Text('Reps'),
        ],
      ),
    );
  }
}
