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
    List<String> shoppingItems = [];
    for (var i = 1; i <= 20; i++) {
      shoppingItems.add("Shopping Item $i");
    }

    return CustomMaterialApp(
      title: name,
      body: SafeArea(
        child: Stack(
          children: [
            ListView.separated(
                itemCount: shoppingItems.length,
                itemBuilder: ((context, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(shoppingItems[index]),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_forever_rounded,
                          ),
                          onPressed: () {},
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        height: (index == shoppingItems.length - 1) ? 100 : 0,
                      )
                    ],
                  );
                }),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                }),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
