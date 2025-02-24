import 'package:book_store_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset>
      slidingAnimation; // offset means that the animation will move the widget from one position to another
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync:
          this, // The TickerProvider that will be used to drive the animation
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward(); // Start the animation
  }

  void navigateToHomeView() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // Wait for 2 seconds then navigate to the next screen
        // Get.to(() => const HomeView(),
        //     transition:
        //         Transition.fade, // used to change the transition animation
        //     duration: kTransitionDuration); // Navigate to the next screen

        // ignore: use_build_context_synchronously
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
