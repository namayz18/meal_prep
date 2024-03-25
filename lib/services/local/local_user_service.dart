import 'package:meal_prep/core/database/local_entity.dart';
import 'package:meal_prep/models/account.dart';
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

  onPressLogin() {
    var user = User(
      id: "1",
      account: Account(
        id: "1",
        firstName: "John",
        lastName: "Doe",
        imageUrl: "assets/images/profile.jpg",
        email: "",
      ),
      isLoggedIn: true,
      age: 25,
      height: 180,
      weight: 70,
      meals: [],
      favoriteMeals: [],
      personalRecipes: [],
      shoppingList: [],
    );

    saveUser(user);
  }

  onPressSignOut() {
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
