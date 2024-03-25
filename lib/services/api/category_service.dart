import 'package:meal_prep/models/Category.dart';
import 'package:meal_prep/services/main/firestore_service.dart';

class CategoryService {
  FirestoreService firestoreService = FirestoreService();
  final collectionName = 'categories';

  Future<List<Category>> fetchCategories() async {
    var categories = await firestoreService.getCollectionData(collectionName);
    var categoryList = categories.map((map) => Category.fromJson(map)).toList();
    return categoryList;
  }
}
