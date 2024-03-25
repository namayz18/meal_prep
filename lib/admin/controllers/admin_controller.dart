import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/api/recipe_service.dart';

class AdminController {
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

  addRecipe(Recipe recipe) async {
    await recipeService.addRecipe(recipe);
  }

  updateRecipe(String id, Recipe recipe) async {
    await recipeService.updateRecipe(id, recipe);
  }

  deleteRecipe(String id) async {
    await recipeService.deleteRecipe(id);
  }
}
