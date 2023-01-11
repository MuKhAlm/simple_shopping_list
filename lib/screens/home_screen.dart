import 'package:flutter/material.dart';
import 'package:simple_shopping_list/main.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';
import 'package:simple_shopping_list/screens/shopping_list_screen.dart';
import 'package:simple_shopping_list/widgets/custom_material_app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ShoppingList> shoppingLists = objectbox.shoppingListBox.getAll();
  List<Widget> cardList = [];
  String newShoppingListName = '';

  @override
  Widget build(BuildContext context) {
    return CustomMaterialApp(
      body: SafeArea(
        child: Stack(
            children: [
                  ListView.separated(
                      itemCount: shoppingLists.length,
                      itemBuilder: ((context, int index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(shoppingLists[index].name),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete_forever_rounded,
                                ),
                                onPressed: () {
                                  objectbox.shoppingListBox
                                      .remove(shoppingLists[index].id);
                                },
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) => ShoppingListScreen(
                                          name: shoppingLists[index].name,
                                        )),
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height:
                                  (index == shoppingLists.length - 1) ? 100 : 0,
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
                      onPressed: () {
                        setState(() {
                          cardList = [
                            newShoppingListCard(context),
                          ];
                        });
                      },
                    ),
                  ),
                ] +
                cardList),
      ),
    );
  }

  Widget newShoppingListCard(BuildContext context) {
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
                      setState(() {
                        newShoppingListName = '';
                        cardList = [];
                      });
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
                            setState(() {
                              newShoppingListName = value;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: IconButton(
                            onPressed: (() {
                              var name;
                              if (newShoppingListName == '') {
                                name = 'Untitled';
                              } else {
                                name = newShoppingListName;
                              }
                              objectbox.shoppingListBox
                                  .put(ShoppingList(name: name));
                              setState(() {
                                cardList = [];
                              });
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
