import 'package:flutter/material.dart';
import 'package:namer_app/data/notifiers.dart';
import 'package:namer_app/views/widget_tree.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier, 
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.teal,
                brightness: isDarkMode ? Brightness.dark : Brightness.light,
              ),
            ),
          home: WidgetTree(),
        );
      },
    );
  }
}
