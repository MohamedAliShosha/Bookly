import 'package:book_store_app/constants.dart';
import 'package:book_store_app/core/utils/app_router.dart';
import 'package:book_store_app/core/utils/assets.dart';
import 'package:book_store_app/core/utils/shared_pref_keys.dart';
import 'package:book_store_app/core/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor,
            kPrimaryColor.withOpacity(0.85),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Logo Section
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset(
                  AssetsData.logo,
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 48),
              // Text Content Section
              Column(
                children: [
                  Text(
                    'Discover Your Next',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                      fontFamily: kGtSectraFine,
                      letterSpacing: 0.5,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Great Book',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontFamily: kGtSectraFine,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Explore thousands of books and find\nyour perfect read',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontFamily: kGtSectraFine,
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.5,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 3),
              // Button Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppButton(
                    onPressed: () {
                      if (isLoggedInUser) {
                        GoRouter.of(context).go(AppRouter.kHomeView);
                      } else {
                        GoRouter.of(context).go(AppRouter.kLoginView);
                      }
                    },
                    title: 'Get Started',
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
