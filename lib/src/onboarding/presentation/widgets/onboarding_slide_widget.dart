import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ncc/core/utils/constants.dart';

class OnboardingSlideWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const OnboardingSlideWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          Image.asset(image, height: 100, width: 100),
          Gap(kMediumGap),
          Text(title),
          Gap(kSmallGap),
          Text(description),
        ],
      ),
    );
  }
}
