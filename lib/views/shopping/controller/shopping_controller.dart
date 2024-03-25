class ShoppingController {
  final shoppingList = <String>[];

  void addItem(String item) {
    shoppingList.add(item);
  }

  void removeItem(String item) {
    shoppingList.remove(item);
  }
}
