import 'package:objectbox/objectbox.dart';
import 'package:simple_shopping_list/models/shopping_item.dart';

@Entity()
class ShoppingList {
  @Id()
  int id;

  String name;

  @Backlink('shoppingList')
  final shoppingItems = ToMany<ShoppingItem>();

  ShoppingList({required this.name, this.id = 0});
}
