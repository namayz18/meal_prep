import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/services/main/firestore_service.dart';

class PlanService {
  FirestoreService firestoreService = FirestoreService();
  final collectionName = 'plans';

  Future<List<Plan>> getPlans() async {
    var plans = await firestoreService.getCollectionData(collectionName);
    return plans.map((map) => Plan.fromJson(map)).toList();
  }

  Future<void> addPlan(Plan plan) async {
    await firestoreService.addDocumentWithId(
      plan.id,
      collectionName,
      plan.toJson(),
    );
    return;
  }

  Future<void> addBulkRecipe(List<Plan> plans) async {
    for (var plan in plans) {
      await addPlan(plan);
    }
    return;
  }
}
