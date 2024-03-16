import 'package:meal_prep/core/database/local_entity.dart';
import 'package:meal_prep/models/user.dart';

class LocalUserService {
  final userRepo = LocalEntityRepository("user");

  saveUser(User user) {
    // add try/catch as you want
    userRepo.createOrUpdate(user);
  }

  List<User> getAllPerson() {
    final Users = userRepo.getAllEntities<User>();
    return Users;
  }

  bool isUserEmpty() {
    final Users = userRepo.getAllEntities<User>();
    return Users.isEmpty;
  }

  User getUserDetail() {
    if (!isUserEmpty()) {
      final users = userRepo.getAllEntities<User>();
      return users.first;
    } else {
      return User(
        id: "1",
        firstName: "",
        lastName: "",
        age: 25,
        height: 180,
        weight: 70,
        imageUrl: "assets/images/profile.jpg",
      );
    }
  }

  onPressLogin() {
    var user = User(
      id: "1",
      firstName: "John",
      lastName: "Doe",
      age: 25,
      height: 180,
      weight: 70,
      imageUrl: "assets/images/profile.jpg",
    );

    saveUser(user);
  }

  onPressSignOut() {
    userRepo.deleteData(getUserDetail().id);
  }
}
