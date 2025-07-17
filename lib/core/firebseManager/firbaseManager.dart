import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseManager {
  static CollectionReference<T> getCollection<T>({
    required String collectionName,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
  }) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .withConverter<T>(
      fromFirestore: (snapshot, _) => fromJson(snapshot.data()!),
      toFirestore: (model, _) => toJson(model),
    );
  }
}
