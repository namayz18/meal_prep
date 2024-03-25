import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/api/recipe_service.dart';

class RecipeController {
  final RecipeService recipeService = RecipeService();

  // Method to fetch recipes from Firestore
  Future<List<Recipe>> getRecipes() async {
    var recipes = await recipeService.fetchRecipes();
    return recipes;
  }

  Future<Recipe?> getRecipe(String id) async {
    var recipe = await recipeService.fetchRecipe(id);
    return recipe;
  }
}
