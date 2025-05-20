import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/widgets/app_logo.dart';
import '../../../shared/widgets/app_button.dart';
import '../../../core/theme/app_colors.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const Padding(
            padding: EdgeInsets.only(left: 24, top: 24),
            child: AppLogo(fontSize: 25, alignment: MainAxisAlignment.start),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'CREATE ACCOUNT',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Create an account to test your lyrical prowess',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SafeArea(
              top: false,
              bottom: false,
              child: SlideTransition(
                position: _slideAnimation,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.zero,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create Account with your preferred wallet',
                        style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 16),
                      AppButton(
                        text: 'Continue with Argent',
                        onPressed: () {},
                        filled: false,
                        icon: Image.asset('assets/img/argent.png', height: 16),
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        text: 'Continue with OKX',
                        onPressed: () {},
                        filled: false,
                        icon: Image.asset('assets/img/okx.png', height: 16),
                      ),
                      const SizedBox(height: 12),
                      AppButton(
                        text: 'Continue with Braavos',
                        onPressed: () {},
                        filled: false,
                        icon: Image.asset('assets/img/bravos.png', height: 16),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: const [
                          Expanded(child: Divider(color: AppColors.stroke)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text('OR', style: TextStyle(color: Colors.black54)),
                          ),
                          Expanded(child: Divider(color: AppColors.stroke)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        text: 'Connect Wallet',
                        onPressed: () {
                          context.go("/create-username");
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 