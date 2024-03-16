import 'package:meal_prep/services/firestore_service.dart';

class ShoppingController {
  FirestoreService firestoreService = FirestoreService();
  final shoppingList = <String>[];

  void addItem(String item) {
    shoppingList.add(item);
  }

  void removeItem(String item) {
    shoppingList.remove(item);
  }
}
