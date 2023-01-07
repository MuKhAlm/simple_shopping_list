import 'package:flutter/material.dart';
import 'package:simple_shopping_list/screens/home_screen.dart';
import 'package:simple_shopping_list/widgets/navigation_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Shopping List'),
        ),
        drawer: const NavigationDrawer(),
        body: const HomeScreen(),
      ),
    );
  }
}
