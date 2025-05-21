import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../shared/widgets/app_dropdown.dart';
import '../../../shared/widgets/app_wager_input.dart';
import '../../../core/theme/app_colors.dart';

class WagerSetupScreen extends StatefulWidget {
  const WagerSetupScreen({super.key});

  @override
  State<WagerSetupScreen> createState() => _WagerSetupScreenState();
}

class _WagerSetupScreenState extends State<WagerSetupScreen> {
  String? selectedGenre;
  String? selectedDifficulty;
  String? selectedDuration;
  String? selectedOdds;
  final wagerController = TextEditingController();
  String selectedCurrency = 'STRK';
  double wagerAmount = 0;
  
  final List<String> odds = [
    '2x (get 20% right)',
    '5x (get 50% right)',
    '8x (get 70% right)',
    '10x (get everything right)',
  ];

  @override
  void dispose() {
    wagerController.dispose();
    super.dispose();
  }

  void _updateWagerAmount(String value) {
    setState(() {
      wagerAmount = double.tryParse(value.replaceAll(',', '')) ?? 0;
    });
  }

  double _calculateWinAmount() {
    if (selectedOdds == null || wagerAmount == 0) return 0;
    
    final multiplier = double.parse(selectedOdds!.split('x')[0]);
    return wagerAmount * multiplier;
  }

  String _formatCurrency(double amount) {
    final formatted = amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '$formatted $selectedCurrency';
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('STRK'),
              onTap: () {
                setState(() => selectedCurrency = 'STRK');
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('USDT'),
              onTap: () {
                setState(() => selectedCurrency = 'USDT');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final winAmount = _calculateWinAmount();
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.go('/home'),
        ),
        title: const Text(
          'Wager (Single Player)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdown(
              label: 'Genre',
              value: selectedGenre,
              items: const ['Pop', 'Hip Hop', 'R&B', 'Rock', 'Country'],
              onChanged: (value) => setState(() => selectedGenre = value),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              label: 'Difficulty Level',
              value: selectedDifficulty,
              items: const ['Easy', 'Medium', 'Hard', 'Expert'],
              onChanged: (value) => setState(() => selectedDifficulty = value),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              label: 'Duration',
              value: selectedDuration,
              items: const ['1 minute', '2 minutes', '5 minutes', '10 minutes'],
              onChanged: (value) => setState(() => selectedDuration = value),
            ),
            const SizedBox(height: 16),
            AppDropdown(
              label: 'Odds',
              value: selectedOdds,
              items: odds,
              onChanged: (value) => setState(() => selectedOdds = value),
            ),
            const SizedBox(height: 16),
            AppWagerInput(
              label: 'You Wager',
              controller: wagerController,
              onChanged: _updateWagerAmount,
              selectedCurrency: selectedCurrency,
              onCurrencyTap: _showCurrencyPicker,
              walletBalance: '18,678 STRK (5,678 USDT)',
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'You Win',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        _formatCurrency(winAmount),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  if (selectedCurrency == 'STRK') ...[
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '(${_formatCurrency(winAmount / 10)} USDT)',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Cancel',
                    onPressed: () => context.go('/home'),
                    filled: false,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppButton(
                    text: 'Start Game',
                    onPressed: () {
                      context.go('/wager-game');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 
} 