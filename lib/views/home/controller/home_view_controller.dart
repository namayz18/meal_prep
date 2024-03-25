import 'package:meal_prep/controllers/recipe_controller.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/local/local_user_service.dart';

class HomeViewController {
  final LocalUserService localUserService = LocalUserService();
  final RecipeController recipeController = RecipeController();

  addMeal() async {
    print(localUserService.getAllPerson().length);
    var meal = Meal(
        id: '1',
        category: 'breakfast',
        recipe: Recipe(
            id: '1',
            name: 'Oatmeal',
            description: 'Oatmeal with fruits',
            duration: '10',
            serving: '1',
            calories: '200',
            image:
                'https://www.budgetbytes.com/wp-content/uploads/2021/09/Classic-Meatloaf-above-768x576.jpg',
            ingredients: [
              Ingredient(name: 'Oatmeal', quantity: '100g'),
              Ingredient(name: 'Milk', quantity: '200ml'),
              Ingredient(name: 'Banana', quantity: '1'),
              Ingredient(name: 'Strawberry', quantity: '50g'),
            ],
            nutritions: [
              Nutrition(name: 'Protein', quantity: '10g'),
              Nutrition(name: 'Fat', quantity: '5g'),
              Nutrition(name: 'Carbohydrate', quantity: '30g'),
            ],
            categories: [
              'breakfast'
            ]),
        eaten: false,
        date: '17/03/2024');
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
