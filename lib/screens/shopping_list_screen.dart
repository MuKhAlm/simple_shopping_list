import 'package:flutter/material.dart';
import 'package:simple_shopping_list/main.dart';
import 'package:simple_shopping_list/models/shopping_item.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';
import 'package:simple_shopping_list/objectbox.g.dart';
import 'package:simple_shopping_list/widgets/custom_material_app.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({
    required this.shoppingList,
    super.key,
  });

  final ShoppingList shoppingList;

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  @override
  Widget build(BuildContext context) {
    late Stream<List<ShoppingItem>> _shoppingItemStream = objectbox
        .shoppingItemBox
        .query(ShoppingItem_.shoppingList.equals(widget.shoppingList.id))
        .watch(triggerImmediately: true)
        .map((query) => query.find());

    return CustomMaterialApp(
      title: widget.shoppingList.name,
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<ShoppingItem>>(
                stream: _shoppingItemStream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const CircularProgressIndicator();
                  }
                  return ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                snapshot.data![index].name,
                                style: (snapshot.data![index].checked)
                                    ? const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2,
                                        fontWeight: FontWeight.w300,
                                      )
                                    : null,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete_forever_rounded,
                                ),
                                onPressed: () {
                                  objectbox.shoppingItemBox
                                      .remove(snapshot.data![index].id);
                                },
                              ),
                              onTap: () {
                                ShoppingItem item = snapshot.data![index];
                                item.checked = !item.checked;
                                objectbox.shoppingItemBox.put(item);
                              },
                            ),
                            SizedBox(
                              height: (index == snapshot.data!.length - 1)
                                  ? 100
                                  : 0,
                            )
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      });
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
