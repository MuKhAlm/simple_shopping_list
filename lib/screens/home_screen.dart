import 'package:flutter/material.dart';
import 'package:simple_shopping_list/main.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';
import 'package:simple_shopping_list/screens/shopping_list_screen.dart';
import 'package:simple_shopping_list/widgets/custom_material_app.dart';
import 'package:simple_shopping_list/widgets/new_shopping_list_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream<List<ShoppingList>> _shoppingListStream = objectbox
      .shoppingListBox
      .query()
      .watch(triggerImmediately: true)
      .map((query) => query.find());
  bool _displayNewShoppingCard = false;

  @override
  Widget build(BuildContext context) {
    return CustomMaterialApp(
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<List<ShoppingList>>(
              stream: _shoppingListStream,
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
                          title: Text(snapshot.data![index].name),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.delete_forever_rounded,
                            ),
                            onPressed: () {
                              objectbox.shoppingListBox
                                  .remove(snapshot.data![index].id);
                            },
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ShoppingListScreen(
                                      shoppingList: snapshot.data![index],
                                    )),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height:
                              (index == snapshot.data!.length - 1) ? 100 : 0,
                        )
                      ],
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                );
              },
            ),
            if (!_displayNewShoppingCard)
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _displayNewShoppingCard = true;
                    });
                  },
                ),
              ),
            if (_displayNewShoppingCard)
              NewShoppingListCard(
                context: context,
                onBack: _handleShoppingListCardOnBack,
              ),
          ],
        ),
      ),
    );
  }

  void _handleShoppingListCardOnBack() {
    setState(() {
      _displayNewShoppingCard = false;
    });
  }
}
