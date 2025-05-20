import 'package:flutter/material.dart';

class CurrencySelector extends StatefulWidget {
  final Function(String) onCurrencyChanged;
  final String initialCurrency;

  const CurrencySelector({
    super.key,
    required this.onCurrencyChanged,
    this.initialCurrency = 'USD',
  });

  @override
  State<CurrencySelector> createState() => _CurrencySelectorState();
}

class _CurrencySelectorState extends State<CurrencySelector> {
  late String selectedCurrency;

  @override
  void initState() {
    super.initState();
    selectedCurrency = widget.initialCurrency;
  }

  void _showCurrencyPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCurrencyOption('USD', 'usd-flag.png'),
            const SizedBox(height: 16),
            _buildCurrencyOption('STRK', 'strk-icon.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyOption(String currency, String iconName) {
    final isSelected = selectedCurrency == currency;
    return InkWell(
      onTap: () {
        setState(() => selectedCurrency = currency);
        widget.onCurrencyChanged(currency);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF8F8F8) : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset('assets/img/$iconName', width: 24, height: 24),
            const SizedBox(width: 12),
            Text(
              currency,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check, color: Color(0xFF7A1DFF), size: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _showCurrencyPicker,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F8F8),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/img/${selectedCurrency == 'USD' ? 'usd-flag.png' : 'strk-icon.png'}',
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            Text(
              selectedCurrency,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
      ),
    );
  }
} 