import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/recipe_service.dart';

class RecipeController {
  final RecipeService recipeService = RecipeService();

  // Method to fetch recipes from Firestore
  Future<List<Recipe>> fetchRecipes() async {
    var recipes = await recipeService.fetchRecipes();
    return recipes;
  }
}
