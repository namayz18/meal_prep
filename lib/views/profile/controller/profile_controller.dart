import 'package:meal_prep/models/user.dart';
import 'package:meal_prep/services/local/local_user_service.dart';

class ProfileController {
  final localUserService = LocalUserService();

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

  onPressLogin() {
    localUserService.onPressLogin();
  }

  onPressSignOut() {
    localUserService.onPressSignOut();
  }
}
