import 'package:flutter/material.dart';
import 'package:simple_shopping_list/widgets/navigation_drawer.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

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
        body: body,
      ),
    );
  }
}
