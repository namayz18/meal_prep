import 'package:meal_prep/core/helper/local_entity.dart';
import 'package:meal_prep/models/account.dart';

class ProfileController {
  final accountRepo = LocalEntityRepository("account");

  savePerson(Account account) {
    // add try/catch as you want
    accountRepo.createOrUpdate(account);
  }

  List<Account> getAllPerson() {
    final accounts = accountRepo.getAllEntities<Account>();
    return accounts;
  }

  bool isAccountEmpty() {
    final accounts = accountRepo.getAllEntities<Account>();
    return accounts.isEmpty;
  }

  Account getAccountDetail() {
    if (!isAccountEmpty()) {
      final accounts = accountRepo.getAllEntities<Account>();
      return accounts.first;
    } else {
      return Account(
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
    var account = Account(
      id: "1",
      firstName: "John",
      lastName: "Doe",
      age: 25,
      height: 180,
      weight: 70,
      imageUrl: "assets/images/profile.jpg",
    );

    savePerson(account);
  }

  onPressSignOut() {
    accountRepo.deleteData(getAccountDetail().id);
  }
}
