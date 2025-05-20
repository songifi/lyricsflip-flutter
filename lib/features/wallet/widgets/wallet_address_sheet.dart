import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletAddressSheet extends StatefulWidget {
  const WalletAddressSheet({super.key});

  @override
  State<WalletAddressSheet> createState() => _WalletAddressSheetState();
}

class _WalletAddressSheetState extends State<WalletAddressSheet> {
  bool showQRCode = false;
  static const walletAddress = '0x0Bbed4Daf99d43D4aBa58fa6eD5A7550f6555';

  void _copyToClipboard() {
    Clipboard.setData(const ClipboardData(text: walletAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Wallet address copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.black),
                onPressed: () => Navigator.pop(context),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          if (!showQRCode) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, children: [
const Text(
              'Your Wallet Address',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF5B5B5B),
              ),
            ),
             Row(
                children: [
                  Expanded(
                    child: Text(
                      walletAddress,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _copyToClipboard,
                    child: const Icon(Icons.copy_outlined, size: 20),
                  ),
                ],
              ),
              ]
              )
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () => setState(() => showQRCode = true),
              child: Row(
                children: [
                  const Icon(Icons.qr_code_2, size: 24),
                  const SizedBox(width: 12),
                  const Text(
                    'View your wallet address',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right, size: 24),
                ],
              ),
            ),
          ] else ...[
            const SizedBox(height: 20),
            const Text(
              'Wallet Address',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFFF7F8F9),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Color(0xFFDBE1E7))
              ),
              child: Column(
                children: [
                  const Text(
                    'TAP TO COPY',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF00D6B3),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: _copyToClipboard,
                    child: QrImageView(
                      data: walletAddress,
                      version: QrVersions.auto,
                      size: 300,
                      
                    ),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text(
                    walletAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
          ],
          const SizedBox(height: 34),
        ],
      ),
    );
  }
} 