import 'package:meal_prep/core/database/local_entity.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/models/user.dart';

class LocalUserService {
  final userRepo = LocalEntityRepository("user");

  void saveUser(User user) {
    try {
      userRepo.createOrUpdate(user);
    } catch (e) {
      print('An error occurred while saving the user: $e');
      // Optionally, you can rethrow the exception or handle it differently based on your requirements
    }
  }

  List<User> getAllPerson() {
    final Users = userRepo.getAllEntities<User>();
    return Users;
  }

  bool isUserEmpty() {
    final Users = userRepo.getAllEntities<User>();
    return Users.isEmpty;
  }

  User? getUserDetail() {
    if (!isUserEmpty()) {
      final users = userRepo.getAllEntities<User>();
      return users.first;
    } else {
      return null;
    }
  }

  deleteUser() {
    var user = getUserDetail();
    if (user != null) {
      userRepo.deleteData(user.id);
    }
  }

  addMeal(Meal meal) {
    var user = getUserDetail();
    if (user != null) {
      user.meals.add(meal);
      saveUser(user);
    }
  }

  List<Meal> getMeals() {
    var user = getUserDetail();
    if (user != null) {
      return user.meals;
    }
    return [];
  }
}
