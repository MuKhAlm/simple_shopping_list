import 'package:objectbox/objectbox.dart';
import 'package:simple_shopping_list/models/shopping_list.dart';

@Entity()
class ShoppingItem {
  @Id()
  int id;

  String name;

  bool checked;

  final shoppingList = ToOne<ShoppingList>();

  ShoppingItem({required this.name, this.id = 0, this.checked = false});
}
