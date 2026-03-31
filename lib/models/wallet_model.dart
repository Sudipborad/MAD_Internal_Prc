import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../models/product_model.dart';

class Wallet {
  final String userId;
  double balance;
  List<Transaction> transactions;

  Wallet({
    required this.userId,
    this.balance = 0.0,
    this.transactions = const [],
  });

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    if (transaction.type == 'credit') {
      balance += transaction.amount;
    } else {
      balance -= transaction.amount;
    }
  }

  factory Wallet.fromJson(Map<String, dynamic> json) {
    return Wallet(
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      transactions: (json['transactions'] as List?)
              ?.map((t) => Transaction.fromJson(t as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'balance': balance,
      'transactions': transactions.map((t) => t.toJson()).toList(),
    };
  }
}

class Transaction {
  final String id;
  final String fromUserId;
  final String toUserId;
  final double amount;
  final String type; // 'credit' or 'debit'
  final String reason; // 'product_sale', 'refund', etc.
  final String? productId;
  final DateTime timestamp;
  final String status; // 'pending', 'completed', 'failed'

  Transaction({
    required this.id,
    required this.fromUserId,
    required this.toUserId,
    required this.amount,
    required this.type,
    required this.reason,
    this.productId,
    required this.timestamp,
    this.status = 'pending',
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      fromUserId: json['fromUserId'] as String,
      toUserId: json['toUserId'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      reason: json['reason'] as String,
      productId: json['productId'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: json['status'] as String? ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'amount': amount,
      'type': type,
      'reason': reason,
      'productId': productId,
      'timestamp': timestamp.toIso8601String(),
      'status': status,
    };
  }
}
