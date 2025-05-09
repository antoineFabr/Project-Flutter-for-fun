import 'package:flutter/material.dart';
import 'package:namer_app/data/notifiers.dart';
import 'package:namer_app/views/pages/book_page.dart';
import 'package:namer_app/views/pages/home_page.dart';
import 'package:namer_app/views/widgets/navbar_widget.dart' show NavbarWidget;

List<Widget> pages = [
  SettingsPage(),
  HomePage(),
];
List brightnessMode = [Brightness.dark, Brightness.light];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  var icon = Icons.dark_mode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("ReadMe"),
          ),
          actions: [
            IconButton(
              onPressed: () {
                isDarkModeNotifier.value = !isDarkModeNotifier.value;
              },
              icon: ValueListenableBuilder(
                valueListenable: isDarkModeNotifier,
                builder: (context, isDarkMode, child) {
                  return Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                  );
                },
              ),
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, value, child) {
            return pages.elementAt(value);
          },
        ),
        bottomNavigationBar: NavbarWidget());
  }
}
