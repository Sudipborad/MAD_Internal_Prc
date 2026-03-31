import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../config/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Stack(
        children: [
          // Background gradient
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  AppColors.accentOrange.withOpacity(0.2),
                  AppColors.accentRed.withOpacity(0.1),
                  AppColors.bgDark,
                ],
                stops: const [0.3, 0.6, 1.0],
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon with pulse animation
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.accentOrange,
                        AppColors.accentRed,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentOrange.withOpacity(0.4),
                        blurRadius: 60,
                        spreadRadius: 20,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.storefront_rounded,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .scale(duration: 1500.ms, end: 1.1),
                const SizedBox(height: 32),
                // Logo text
                Text(
                  'TRADE',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.textLight,
                        letterSpacing: 4,
                      ),
                ).animate().fadeIn(duration: 600.ms),
                const SizedBox(height: 8),
                Text(
                  'HUB',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.accentOrange,
                        letterSpacing: 4,
                      ),
                ).animate().fadeIn(duration: 800.ms),
                const SizedBox(height: 16),
                // Tagline
                Text(
                  'PEER-TO-PEER MARKETPLACE',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        letterSpacing: 2,
                      ),
                ).animate().fadeIn(duration: 1000.ms),
              ],
            ),
          ),
          // Progress indicator at bottom
          Positioned(
            bottom: 48,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 120,
                height: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    backgroundColor: AppColors.borderDark,
                    valueColor: AlwaysStoppedAnimation(AppColors.accentOrange),
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
