
import 'package:meal_prep/services/firestore_service.dart';
import 'package:meal_prep/models/recipe.dart';

class RecipeService {
  FirestoreService firestoreService = FirestoreService();
  final collectionName = 'recipes';

  Future<List<Recipe>> fetchRecipes() async {
    var recipes = await firestoreService.getCollectionData(collectionName);
    var recipeList = recipes.map((map) => Recipe.fromJson(map)).toList();
    return recipeList;
  }

  Future<void> addRecipe(Recipe recipe) async {
    await firestoreService.addDocument(collectionName, recipe.toJson());
    return;
  }
}
