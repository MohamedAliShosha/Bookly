import 'package:book_store_app/Features/onboarding/presentation/widgets/onboarding_view_body.dart';
import 'package:book_store_app/constants.dart';

import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: OnboardingViewBody(theme: theme),
    );
  }
}
