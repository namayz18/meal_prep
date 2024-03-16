import 'package:meal_prep/core/services/firestore_service.dart';

class ShoppingController {
  FirestoreService firestoreService = FirestoreService();
  final shoppingList = <String>[];

  void addItem(String item) {
    shoppingList.add(item);
  }

  void removeItem(String item) {
    shoppingList.remove(item);
  }

  addRecipe() async {
    // Add a new document
    Map<String, dynamic> newRecipe = {
      "id": "3",
      "name": "Homemade Mac and Cheese",
      "description":
          "Creamy roux-based cheese sauce that will satisfy all of your cheesy pasta cravings",
      "duration": "45 minutes",
      "serving": "4",
      "calories": "450 kcal per serving",
      "image":
          "https://www.budgetbytes.com/wp-content/uploads/2021/12/Homemade-Mac-and-Cheese-above-768x512.jpg",
      "ingredients": [
        {"name": "Chicken", "quantity": "200g"},
        {"name": "Noodle", "quantity": "100g"},
        {"name": "Carrot", "quantity": "50g"},
        {"name": "Onion", "quantity": "50g"},
        {"name": "Celery", "quantity": "50g"},
        {"name": "Garlic", "quantity": "10g"},
        {"name": "Olive Oil", "quantity": "20g"},
        {"name": "Salt", "quantity": "5g"},
        {"name": "Pepper", "quantity": "5g"},
        {"name": "Water", "quantity": "500ml"},
      ],
      "nutritions": [
        {"name": "Calories", "quantity": "450kcal"},
        {"name": "Protein", "quantity": "20g"},
        {"name": "Fat", "quantity": "10g"},
        {"name": "Carbohydrate", "quantity": "30g"},
        {"name": "Fiber", "quantity": "5g"},
        {"name": "Sugar", "quantity": "5g"},
        {"name": "Sodium", "quantity": "500mg"},
        {"name": "Cholesterol", "quantity": "50mg"},
        {"name": "Vitamin A", "quantity": "1000IU"},
        {"name": "Vitamin C", "quantity": "10mg"},
        {"name": "Calcium", "quantity": "100mg"},
        {"name": "Iron", "quantity": "5mg"},
      ],
      "steps": [
        "Step 1: Boil the chicken in water for 20 minutes",
        "Step 2: Remove the chicken and shred it into small pieces",
        "Step 3: In a large pot, heat the olive oil over medium heat",
      ]
    };
    await firestoreService.addDocument('recipes', newRecipe);
  }
}
