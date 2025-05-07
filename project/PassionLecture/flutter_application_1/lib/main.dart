import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        )),
        home: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("ReadMe"),
            ),
          ),
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(icon: Icon(Icons.book), label: 'Books'),
              NavigationDestination(icon: Icon(Icons.home), label: 'home')
            ],
            onDestinationSelected: (int value) {
              setState(() {
                selectedIndex = value;
              });
            },
            selectedIndex: selectedIndex,
          ),
        ));
  }
}
