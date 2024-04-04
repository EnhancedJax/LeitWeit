import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:lietweit/pages/workout.dart';
import 'package:lietweit/pages/profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static ColorScheme _defaultLightColorScheme() {
    return ColorScheme.fromSeed(
        seedColor: Colors.amber.shade700, brightness: Brightness.light);
  }

  static ColorScheme _defaultDarkColorScheme() {
    return ColorScheme.fromSeed(
        seedColor: Colors.amber.shade700, brightness: Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Inter',
          colorScheme: lightColorScheme ?? _defaultLightColorScheme(),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          fontFamily: 'Inter',
          colorScheme: darkColorScheme ?? _defaultDarkColorScheme(),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: HomeLayout(key: UniqueKey(), title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class _Page {
  _Page({required this.widget});
  final StatelessWidget widget;
}

List<_Page> _allPages = <_Page>[
  _Page(widget: const WorkoutTab()),
  _Page(widget: const ProfileTab()),
];

class HomeLayout extends StatefulWidget {
  const HomeLayout({required Key key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a task'),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((_Page page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                  key: ObjectKey(page.widget),
                  padding: const EdgeInsets.all(12.0),
                  child: page.widget),
            );
          }).toList()),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  // _showModal();
                }),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  // void _showModal() {
  //   showModalBottomSheet<void>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ListTile(
  //               leading: const Icon(Icons.music_note),
  //               title: const Text('Screen 1'),
  //               onTap: () {
  //                 _controller.animateTo(0);
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_album),
  //               title: const Text('Screen 2'),
  //               onTap: () {
  //                 _controller.animateTo(1);
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.videocam),
  //               title: const Text('Screen 3'),
  //               onTap: () {
  //                 _controller.animateTo(2);
  //                 Navigator.pop(context);
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
