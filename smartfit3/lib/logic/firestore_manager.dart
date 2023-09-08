import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smartfit3/logic/enums.dart';
import 'package:smartfit3/logic/models.dart';

class FirestoreManager {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch a list of documents from a collection
  Future<List<DocumentSnapshot>> fetchDocuments(String collectionName) async {
    QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();
    return querySnapshot.docs;
  }

  // Add a new document to a collection
  Future<void> addDocument(String collectionName, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).add(data);
  }

  // Update an existing document in a collection
  Future<void> updateDocument(String collectionName, String documentId, Map<String, dynamic> data) async {
    await _firestore.collection(collectionName).doc(documentId).update(data);
  }

  // Delete a document from a collection
  Future<void> deleteDocument(String collectionName, String documentId) async {
    await _firestore.collection(collectionName).doc(documentId).delete();
  }

  Future<void> createClient(Client client) async {
    try {
      await _firestore.collection('clients').doc(client.id).set(client.toFirestore());
    } catch (e) {
      print("Error creating client: $e");
      throw e;
    }
  }

  Future<void> createTrainer(Trainer trainer) async {
    try {
      await _firestore.collection('trainers').doc(trainer.id).set(trainer.toFirestore());
    } catch (e) {
      print("Error creating trainer: $e");
      throw e;
    }
  }

  // Get user type based on UID
  Future<UserType> getUserType(String uid) async {
    try {
      DocumentSnapshot clientDoc = await _firestore.collection('clients').doc(uid).get();
      DocumentSnapshot trainerDoc = await _firestore.collection('trainers').doc(uid).get();

      if (clientDoc.exists) {
        return UserType.Client;
      } else if (trainerDoc.exists) {
        return UserType.Trainer;
      } else {
        // Handle the case where neither document exists
        return UserType.Client; // Return a default UserType value
      }
    } catch (error) {
      // Handle the error gracefully, e.g., log the error and return a default value
      print('Error fetching user type: $error');
      return UserType.Client;
    }
  }

  Future<String?> getUserNameByUID(String uid) async {
    try {
      DocumentSnapshot clientDoc = await _firestore.collection('clients').doc(uid).get();
      DocumentSnapshot trainerDoc = await _firestore.collection('trainers').doc(uid).get();
      if (clientDoc.exists) {
        return clientDoc['name'] as String?;
      }else if(trainerDoc.exists) {
        return trainerDoc['name'] as String?;
      }else {
        return 'User';
      }
    } catch (error) {
      print('Error fetching user name by UID: $error');
      return null; // Return null in case of error
    }
  }

}
