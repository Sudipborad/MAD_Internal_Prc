import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create user profile
  Future<void> createUserProfile(User user) async {
    try {
      await _firestore.collection('users').doc(user.uid).set(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // Get user profile
  Future<User?> getUserProfile(String uid) async {
    try {
      final doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return User.fromJson({...doc.data()!, 'uid': doc.id});
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Update user profile
  Future<void> updateUserProfile(String uid, Map<String, dynamic> data) async {
    try {
      await _firestore.collection('users').doc(uid).update(data);
    } catch (e) {
      rethrow;
    }
  }

  // Get user ratings
  Future<double> getUserRating(String uid) async {
    try {
      final reviews = await _firestore
          .collection('reviews')
          .where('sellerId', isEqualTo: uid)
          .get();

      if (reviews.docs.isEmpty) return 0.0;

      final totalRating = reviews.docs.fold<double>(
        0,
        (sum, doc) => sum + (doc['rating'] as num).toDouble(),
      );

      return totalRating / reviews.docs.length;
    } catch (e) {
      rethrow;
    }
  }
}
