import 'package:flutter/material.dart';
import 'package:simple_shopping_list/main.dart';
import 'package:simple_shopping_list/models/shopping_item.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';

class NewShoppingItemCard extends StatelessWidget {
  const NewShoppingItemCard({
    Key? key,
    required this.context,
    required this.onBack,
    required this.shoppingList,
  }) : super(key: key);

  final BuildContext context;
  final Function onBack;
  final ShoppingList shoppingList;

  @override
  Widget build(BuildContext context) {
    String newShoppingItemName = '';

    return Center(
      child: SizedBox(
        width: 300,
        height: 200,
        child: Card(
          elevation: 20,
          color: Theme.of(context).colorScheme.onBackground,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      onBack();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Shopping Item Name',
                          ),
                          onChanged: (value) {
                            newShoppingItemName = value;
                          },
                          onFieldSubmitted: ((value) {
                            submit(newShoppingItemName);
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            onPressed: () {
                              submit(newShoppingItemName);
                            },
                            icon: const Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  submit(String newShoppingItemName) {
    String name;
    if (newShoppingItemName == '') {
      name = 'Untitled';
    } else {
      name = newShoppingItemName;
    }
    shoppingList.shoppingItems.add(ShoppingItem(name: name));
    objectbox.shoppingListBox.put(shoppingList);
    onBack();
  }
}
