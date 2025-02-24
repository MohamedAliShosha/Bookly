import 'package:flutter/material.dart';

class SlidingAnimatedText extends StatelessWidget {
  const SlidingAnimatedText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            // Slide the text from the bottom to the top
            position: slidingAnimation,
            child: const Text(
              'Read Free Books',
              textAlign: TextAlign
                  .center, // The Frame that surrounds the text take the full width of the screen
              // So When i need to move the text i use the textAlign property
            ),
          );
        });
  }
}
