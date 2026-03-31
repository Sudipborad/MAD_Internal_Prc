import 'package:flutter/material.dart';
import '../config/theme.dart';
import '../models/wallet_model.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final addFundsController = TextEditingController();
  bool isLoading = false;

  // Mock data - will be replaced with real wallet data
  double walletBalance = 500.00;
  List<Transaction> transactions = [
    Transaction(
      id: '1',
      fromUserId: 'user1',
      toUserId: 'user2',
      amount: 50.00,
      type: 'debit',
      reason: 'product_purchase',
      productId: 'prod1',
      timestamp: DateTime.now().subtract(const Duration(hours: 2)),
      status: 'completed',
    ),
    Transaction(
      id: '2',
      fromUserId: 'user3',
      toUserId: 'user1',
      amount: 75.00,
      type: 'credit',
      reason: 'product_sale',
      productId: 'prod2',
      timestamp: DateTime.now().subtract(const Duration(days: 1)),
      status: 'completed',
    ),
  ];

  @override
  void dispose() {
    addFundsController.dispose();
    super.dispose();
  }

  void _showAddFundsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardDark,
        title: const Text('Add Funds'),
        content: TextField(
          controller: addFundsController,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: AppColors.textLight),
          decoration: InputDecoration(
            hintText: 'Enter amount',
            hintStyle: const TextStyle(color: AppColors.textMuted),
            prefixText: '\$ ',
            filled: true,
            fillColor: AppColors.bgDark,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (addFundsController.text.isNotEmpty) {
                final amount = double.tryParse(addFundsController.text);
                if (amount != null && amount > 0) {
                  setState(() {
                    walletBalance += amount;
                  });
                  addFundsController.clear();
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('\$${amount.toStringAsFixed(2)} added'),
                    ),
                  );
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentOrange,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        title: const Text('My Wallet'),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance card
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.accentOrange, AppColors.accentRed],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Balance',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '\$${walletBalance.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _showAddFundsDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.accentOrange,
                      ),
                      child: const Text('Add Funds'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Transaction history
              Text(
                'Transaction History',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              if (transactions.isEmpty)
                Center(
                  child: Text(
                    'No transactions yet',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.textMuted),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    final txn = transactions[index];
                    final isCredit = txn.type == 'credit';
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.cardDark,
                        border: Border.all(color: AppColors.borderDark),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: isCredit
                                  ? AppColors.greenSuccess.withOpacity(0.2)
                                  : AppColors.accentRed.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                              color: isCredit
                                  ? AppColors.greenSuccess
                                  : AppColors.accentRed,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  txn.reason == 'product_sale'
                                      ? 'Product Sale'
                                      : 'Product Purchase',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${txn.timestamp.day}/${txn.timestamp.month}/${txn.timestamp.year}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: AppColors.textMuted),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${isCredit ? '+' : '-'}\$${txn.amount.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: isCredit
                                  ? AppColors.greenSuccess
                                  : AppColors.accentRed,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
