import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/models/user.dart';
import 'package:meal_prep/services/api/plan_service.dart';
import 'package:meal_prep/services/local/local_user_service.dart';

class MealViewController {
  final LocalUserService localUserService = LocalUserService();
  final PlanService planService = PlanService();

  Future<List<Plan>> getMealPlans() async {
    return await planService.getPlans();
  }

  ActivePlan? getActivePlan() {
    return localUserService.getUserDetail().plan;
  }

  List<List<Meal>> createMealList(Plan plan) {
    List<List<Meal>> mealList = [];
    List<Meal> meals = creatMeal(plan);
    for (int i = 0; i < plan.totalDays; i++) {
      mealList.add(meals);
    }
    return mealList;
  }

  List<Meal> creatMeal(Plan plan) {
    List<Meal> meals = [];
    for (Recipe recipe in plan.recipeList) {
      Meal meal = Meal(
        id: recipe.id,
        category: recipe.category,
        time: '7:00 AM',
        calories: recipe.calories,
        recipe: recipe,
      );
      meals.add(meal);
    }
    return meals;
  }

  createActivePlan(
    Plan plan,
    DateTime startDate,
    DateTime endDate,
  ) {
    List<List<Meal>> mealList = createMealList(plan);
    ActivePlan activePlan = ActivePlan(
      id: plan.id,
      title: plan.title,
      description: plan.description,
      imageUrl: plan.imageUrl,
      totalDays: plan.totalDays,
      completedDays: 0,
      startDate: startDate,
      endDate: endDate,
      mealList: mealList,
    );
    setActivePlan(activePlan);
  }

  startPlan(Plan plan) {
    DateTime now = DateTime.now();
    DateTime startDate = now;
    DateTime endDate = now.add(Duration(days: plan.totalDays));
    createActivePlan(plan, startDate, endDate);
  }

  setActivePlan(ActivePlan plan) {
    User user = localUserService.getUserDetail();
    user.plan = plan;
    localUserService.saveUser(user);
  }
}
