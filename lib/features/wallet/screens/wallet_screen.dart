import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/currency_selector.dart';
import '../widgets/transaction_list_item.dart';
import '../widgets/wallet_action_button.dart';
import '../widgets/wallet_address_sheet.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String selectedCurrency = 'USD';
  
  void _showWalletAddress() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const WalletAddressSheet(),
    );
  }

  void _onCurrencyChanged(String currency) {
    setState(() => selectedCurrency = currency);
  }

  @override
  Widget build(BuildContext context) {
    final isUSD = selectedCurrency == 'USD';
    final mainAmount = isUSD ? '\$ 689.00' : '24,9876 STRK';
    final subAmount = isUSD ? '24,9876 STRK' : '\$ 689.00';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () =>{
              context.go('/notifications')
            }
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CurrencySelector(
              onCurrencyChanged: _onCurrencyChanged,
              initialCurrency: selectedCurrency,
            ),
            const SizedBox(height: 24),
            const Text(
              'Wallet balance',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              mainAmount,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subAmount,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WalletActionButton(
                  icon: Icons.arrow_outward,
                  label: 'Send',
                  onTap: () {},
                ),
                WalletActionButton(
                  icon: Icons.add,
                  label: 'Fund',
                  onTap: () {},
                  isPrimary: true,
                ),
                WalletActionButton(
                  icon: Icons.account_balance,
                  label: 'Details',
                  onTap: _showWalletAddress,
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent Transaction',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xFF7A1DFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            TransactionListItem(
              icon: Icons.celebration,
              title: 'You earned a reward',
              date: '15 March, 2025 • 12:43 PM',
              amount: '+400 USD',
              subAmount: '10,654 STRK',
              isPositive: true,
            ),
            TransactionListItem(
              icon: Icons.arrow_outward,
              title: 'Bet placed',
              date: '15 March, 2025 • 12:43 PM',
              amount: '-400 USD',
              subAmount: '10,654 STRK',
              isPositive: false,
            ),
            TransactionListItem(
              icon: Icons.add,
              title: 'Wallet Funded',
              date: '15 March, 2025 • 12:43 PM',
              amount: '+400 USD',
              subAmount: '10,654 STRK',
              isPositive: true,
            ),
          ],
        ),
      ),
    );
  }
} 