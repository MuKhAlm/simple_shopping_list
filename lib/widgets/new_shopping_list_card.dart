import 'package:flutter/material.dart';
import 'package:simple_shopping_list/main.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';

class NewShoppingListCard extends StatelessWidget {
  const NewShoppingListCard({
    Key? key,
    required this.context,
    required this.onBack,
  }) : super(key: key);

  final BuildContext context;
  final Function onBack;

  @override
  Widget build(BuildContext context) {
    String newShoppingListName = '';

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
                            hintText: 'Shopping List Name',
                          ),
                          onChanged: (value) {
                            newShoppingListName = value;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            onPressed: (() {
                              String name;
                              if (newShoppingListName == '') {
                                name = 'Untitled';
                              } else {
                                name = newShoppingListName;
                              }
                              objectbox.shoppingListBox
                                  .put(ShoppingList(name: name));
                              onBack();
                            }),
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
}
