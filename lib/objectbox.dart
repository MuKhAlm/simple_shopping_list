import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:simple_shopping_list/models/shopping_item.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';

import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;

  late final Box<ShoppingList> shoppingListBox;
  late final Box<ShoppingItem> shoppingItemBox;

  ObjectBox._create(this.store) {
    shoppingListBox = Box<ShoppingList>(store);
    shoppingItemBox = Box<ShoppingItem>(store);

    if (shoppingListBox.isEmpty()) {
      final shoppingLists = [
        ShoppingList(name: 'Shopping List 1'),
        ShoppingList(name: 'Shopping List 2'),
        ShoppingList(name: 'Shopping List 3'),
      ];

      shoppingListBox.putMany(shoppingLists);
    }
  }

  static Future<ObjectBox> create() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final databaseDirectory = p.join(documentDirectory.path, 'obx-db-dev');

    final store = await openStore(directory: databaseDirectory);
    return ObjectBox._create(store);
  }
}
