import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/recipe_service.dart';

class RecipeController {
  final RecipeService recipeService = RecipeService();
  final List<Recipe> recipeList = <Recipe>[];

  // Method to fetch recipes from Firestore
  Future<void> fetchRecipes() async {
    var recipes = await recipeService.fetchRecipes();
    // Clear existing recipes and add new ones
    recipeList.clear();
    recipeList.addAll(recipes);
  }
}
