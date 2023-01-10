import 'package:flutter/material.dart';
import 'package:simple_shopping_list/widgets/custom_material_app.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialApp(
      title: name,
      body: const Placeholder(),
    );
  }
}
