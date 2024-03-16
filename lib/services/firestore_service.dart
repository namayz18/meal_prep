import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Get all documents from a collection
  Future<List<Map<String, dynamic>>> getCollectionData(
      String collectionName) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _db.collection(collectionName).get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print('Error fetching collection data: $e');
      rethrow; // Propagate the error
    }
  }

  // Get a document from a collection by its ID
  Future<Map<String, dynamic>?> getDocumentById(
      String collectionName, String documentId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _db.collection(collectionName).doc(documentId).get();
      return documentSnapshot.exists ? documentSnapshot.data() : null;
    } catch (e) {
      print('Error fetching document by ID: $e');
      rethrow; // Propagate the error
    }
  }

  // Add a document to a collection
  Future<void> addDocument(
      String collectionName, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionName).add(data);
    } catch (e) {
      print('Error adding document: $e');
      rethrow; // Propagate the error
    }
  }

  // Update a document in a collection
  Future<void> updateDocument(String collectionName, String documentId,
      Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionName).doc(documentId).update(data);
    } catch (e) {
      print('Error updating document: $e');
      rethrow; // Propagate the error
    }
  }

  // Delete a document from a collection
  Future<void> deleteDocument(String collectionName, String documentId) async {
    try {
      await _db.collection(collectionName).doc(documentId).delete();
    } catch (e) {
      print('Error deleting document: $e');
      rethrow; // Propagate the error
    }
  }
}
