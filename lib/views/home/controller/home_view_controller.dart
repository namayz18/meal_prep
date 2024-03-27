import 'package:meal_prep/controllers/recipe_controller.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/services/local/local_user_service.dart';

class HomeViewController {
  final LocalUserService localUserService = LocalUserService();
  final RecipeController recipeController = RecipeController();

  addMeal(Meal meal) async {
    await localUserService.addMeal(meal);
  }

  Future<List<Meal>?> getMeals() async {
    return localUserService.getMeals();
  }

  Meal? getBreakfastMeal() {
    var meals = localUserService.getMeals();
    if (meals.isNotEmpty) {
      return meals.firstWhere((meal) => meal.category == 'breakfast');
    }
    return null;
  }
}
