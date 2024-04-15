import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/api/plan_service.dart';
import 'package:meal_prep/services/api/recipe_service.dart';
import 'package:uuid/uuid.dart';

class AdminController {
  final RecipeService recipeService = RecipeService();
  final PlanService planService = PlanService();
  List<Recipe> recipes = recipeData;

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

  addBulkRecipe(List<Recipe> recipes) async {
    await recipeService.addBulkRecipe(recipes);
  }

  updateRecipe(String id, Recipe recipe) async {
    await recipeService.updateRecipe(id, recipe);
  }

  deleteRecipe(String id) async {
    await recipeService.deleteRecipe(id);
  }

  addPlan() async {
    List<Recipe> recipeList = await getRecipes();
    Plan plan = Plan(
      id: const Uuid().v4(),
      title: 'High Protein Meal Plan',
      totalDays: 14,
      imageUrl: '',
      description:
          'This plan is designed to help you build muscle and lose fat.',
      recipeList: recipeList,
    );
    await planService.addPlan(plan);
  }
}

class let {}
