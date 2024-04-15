import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/services/local/local_user_service.dart';

class HomeViewController {
  final LocalUserService localUserService = LocalUserService();

  List<Meal> getMeals(DateTime selectedDate) {
    var user = localUserService.getUserDetail();
    ActivePlan? activePlan = user.plan;

    if (activePlan != null &&
        (selectedDate.isAtSameMomentAs(activePlan.startDate) ||
            selectedDate.isAtSameMomentAs(activePlan.endDate) ||
            (selectedDate.isAfter(activePlan.startDate) &&
                selectedDate.isBefore(activePlan.endDate)))) {
      int index = selectedDate.difference(activePlan.startDate).inDays;
      return activePlan.mealList[index];
    }
    return [];
  }
}
