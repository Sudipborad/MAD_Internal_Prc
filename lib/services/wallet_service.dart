import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/wallet_model.dart';

class WalletService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create wallet for user
  Future<void> createWallet(String userId) async {
    try {
      await _firestore.collection('wallets').doc(userId).set({
        'userId': userId,
        'balance': 0.0,
        'transactions': [],
        'createdAt': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Get user wallet
  Future<Wallet?> getWallet(String userId) async {
    try {
      final doc = await _firestore.collection('wallets').doc(userId).get();
      if (doc.exists) {
        return Wallet.fromJson({...doc.data()!, 'userId': userId});
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Add funds to wallet
  Future<void> addFunds(String userId, double amount, String reason) async {
    try {
      final transaction = Transaction(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        fromUserId: userId,
        toUserId: userId,
        amount: amount,
        type: 'credit',
        reason: reason,
        timestamp: DateTime.now(),
        status: 'completed',
      );

      await _firestore.collection('wallets').doc(userId).update({
        'balance': FieldValue.increment(amount),
        'transactions': FieldValue.arrayUnion([transaction.toJson()]),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Transfer funds between users (for product purchase)
  Future<bool> transferFunds({
    required String buyerId,
    required String sellerId,
    required double amount,
    required String productId,
    required String productTitle,
  }) async {
    try {
      final txnId = DateTime.now().millisecondsSinceEpoch.toString();

      // Check buyer balance
      final buyerDoc = await _firestore.collection('wallets').doc(buyerId).get();
      final buyerBalance = (buyerDoc.data()?['balance'] as num?)?.toDouble() ?? 0.0;

      if (buyerBalance < amount) {
        throw Exception('Insufficient wallet balance');
      }

      // Create transactions
      final debitTxn = Transaction(
        id: '${txnId}_debit',
        fromUserId: buyerId,
        toUserId: sellerId,
        amount: amount,
        type: 'debit',
        reason: 'product_purchase',
        productId: productId,
        timestamp: DateTime.now(),
        status: 'completed',
      );

      final creditTxn = Transaction(
        id: '${txnId}_credit',
        fromUserId: buyerId,
        toUserId: sellerId,
        amount: amount,
        type: 'credit',
        reason: 'product_sale',
        productId: productId,
        timestamp: DateTime.now(),
        status: 'completed',
      );

      // Update buyer wallet
      await _firestore.collection('wallets').doc(buyerId).update({
        'balance': FieldValue.increment(-amount),
        'transactions': FieldValue.arrayUnion([debitTxn.toJson()]),
      });

      // Update seller wallet
      await _firestore.collection('wallets').doc(sellerId).update({
        'balance': FieldValue.increment(amount),
        'transactions': FieldValue.arrayUnion([creditTxn.toJson()]),
      });

      return true;
    } catch (e) {
      rethrow;
    }
  }

  // Get transaction history
  Stream<List<Transaction>> getTransactionHistory(String userId) {
    return _firestore
        .collection('wallets')
        .doc(userId)
        .snapshots()
        .map((doc) {
      if (doc.exists) {
        final wallet = Wallet.fromJson({...doc.data()!, 'userId': userId});
        return wallet.transactions;
      }
      return [];
    });
  }
}
