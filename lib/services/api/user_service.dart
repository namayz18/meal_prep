import 'package:meal_prep/models/user.dart';
import 'package:meal_prep/services/main/firestore_service.dart';

class UserService {
  FirestoreService firestoreService = FirestoreService();
  final collectionName = 'users';

  Future<User?> fetchUser(String id) async {
    var data = await firestoreService.getDocumentById(collectionName, id);
    if (data == null) return null;
    var user = User.fromJson(data);
    return user;
  }
}
