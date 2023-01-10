import 'package:flutter/material.dart';
import 'package:simple_shopping_list/screens/shopping_list_screen.dart';
import 'package:simple_shopping_list/widgets/custom_material_app.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> shoppingLists = [];
    for (var i = 1; i <= 20; i++) {
      shoppingLists.add("Shopping List $i");
    }
    return CustomMaterialApp(
      body: SafeArea(
        child: Stack(children: [
          ListView.separated(
              itemCount: shoppingLists.length,
              itemBuilder: ((context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(shoppingLists[index]),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete_forever_rounded,
                        ),
                        onPressed: () {},
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => ShoppingListScreen(
                                  name: shoppingLists[index],
                                )),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: (index == shoppingLists.length - 1) ? 100 : 0,
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
        ]),
      ),
    );
  }
}
