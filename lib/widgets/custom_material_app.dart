import 'package:flutter/material.dart';
import 'package:simple_shopping_list/widgets/navigation_drawer.dart';

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    Key? key,
    required this.body,
    this.title = 'Simple Shopping List',
  }) : super(key: key);

  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Shopping List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: const NavigationDrawer(),
        body: body,
      ),
    );
  }
}
