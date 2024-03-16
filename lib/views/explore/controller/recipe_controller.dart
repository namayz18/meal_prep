import 'package:meal_prep/core/services/firestore_service.dart';
import 'package:meal_prep/models/recipe.dart';

class RecipeController {
  FirestoreService firestoreService = FirestoreService();
  final List<Recipe> recipeList = <Recipe>[];
  bool isLoading = true;

  // Method to fetch recipes from Firestore
  Future<void> fetchRecipes() async {
    var recipes = await firestoreService.getCollectionData('recipes');
    // Clear existing recipes and add new ones
    recipeList.clear();
    recipeList.addAll(recipes.map((map) => Recipe.fromJson(map)));
    isLoading = false;
  }
}
