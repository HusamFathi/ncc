import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class AppLogoWidget extends StatelessWidget {
  final void Function() onTap;
  const AppLogoWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kRoundedCorners),
          child: Image.asset(
            "assets/images/ncc.jpg",
            height: 80,
            width: 80,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
