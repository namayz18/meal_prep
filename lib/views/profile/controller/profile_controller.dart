import 'package:meal_prep/models/user.dart';
import 'package:meal_prep/services/local/local_user_service.dart';

class ProfileController {
  final localUserService = LocalUserService();

  saveUserDetails(String? gender, int? age, int? height, int? weight) {
    final user = User(
      id: "1",
      firstName: "John",
      lastName: "Doe",
      imageUrl: "assets/images/profile.jpg",
      email: "",
      isLoggedIn: true,
      gender: gender ?? '',
      age: age ?? 0,
      height: height ?? 0,
      weight: weight ?? 0,
      meals: [],
      favoriteMeals: [],
      personalRecipes: [],
      shoppingList: [],
      joinedAt: DateTime.now(),
    );
    saveUser(user);
  }

  saveUser(User user) {
    localUserService.saveUser(user);
  }

  List<User> getAllPerson() {
    return localUserService.getAllPerson();
  }

  bool isUserEmpty() {
    return localUserService.isUserEmpty();
  }

  User? getUserDetail() {
    return localUserService.getUserDetail();
  }
}
