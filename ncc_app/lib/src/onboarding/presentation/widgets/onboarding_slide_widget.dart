import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/src/widgets/base_animator_widget.dart';
import '../../../../core/utils/constants.dart';

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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        kSmallPadding,
        kLargePadding * 3,
        kSmallPadding,
        kSmallPadding,
      ),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        mainAxisSize: .min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.white,
              padding: EdgeInsets.all(kSmallPadding),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                height: 180,
                width: 180,
              ),
            ),
          ),
          Gap(kMediumGap),
          BaseAnimatorWidget(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                height: 1.15,
              ),
            ),
          ),
          Gap(kSmallGap),
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: Colors.white.withValues(alpha: .88),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
