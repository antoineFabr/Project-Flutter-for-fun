import 'package:flutter/material.dart';
import 'package:namer_app/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier, 
      builder: (context, selectedPage, child) {
      return NavigationBar(
            destinations: [
              NavigationDestination(icon: Icon(Icons.book), label: 'Books'),
              NavigationDestination(icon: Icon(Icons.home), label: 'home')
            ],
            onDestinationSelected: (int value) {
              selectedPageNotifier.value = value;
            },
            selectedIndex: selectedPage,
          );
    },
    );
  }
}
