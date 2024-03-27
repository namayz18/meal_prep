import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/services/main/firestore_service.dart';

class RecipeService {
  FirestoreService firestoreService = FirestoreService();
  final collectionName = 'recipes';

  Future<List<Recipe>> fetchRecipes() async {
    var recipes = await firestoreService.getCollectionData(collectionName);
    var recipeList = recipes.map((map) => Recipe.fromJson(map)).toList();
    return recipeList;
  }

  Future<Recipe?> fetchRecipe(String id) async {
    var response = await firestoreService.getDocumentById(collectionName, id);
    if (response == null) {
      return null;
    }
    var recipe = Recipe.fromJson(response);
    return recipe;
  }

  Future<void> addRecipe(Recipe recipe) async {
    await firestoreService.addDocumentWithId(
      recipe.id,
      collectionName,
      recipe.toJson(),
    );
    return;
  }

  Future<void> updateRecipe(String id, Recipe recipe) async {
    await firestoreService.updateDocument(collectionName, id, recipe.toJson());
    return;
  }

  Future<void> deleteRecipe(String id) async {
    await firestoreService.deleteDocument(collectionName, id);
    return;
  }

  Future<void> addBulkRecipe(List<Recipe> recipes) async {
    for (var recipe in recipes) {
      await addRecipe(recipe);
    }
    return;
  }
}
