import 'package:flutter/material.dart';

class CustomBookImage2 extends StatelessWidget {
  const CustomBookImage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('Assets/images/test_image.png'),
      ),
    );
  }
}
