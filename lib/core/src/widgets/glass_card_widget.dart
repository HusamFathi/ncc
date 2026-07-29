import 'dart:ui'; // Import for ImageFilter

import 'package:flutter/material.dart';

// import 'package:glass/glass.dart'; // Remove this import

import '../../utils/constants.dart';

class GlassCardWidget extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;
  final Color glassColor;
  final double blurStrengthX;
  final double blurStrengthY;

  const GlassCardWidget({
    super.key,
    required this.child,
    this.borderRadius = kRoundedCorners,
    this.padding = const EdgeInsets.all(kSmallPadding),
    this.glassColor = Colors.white, // Default glass color
    this.blurStrengthX = 5.0, // Default blur strength
    this.blurStrengthY = 5.0, // Default blur strength
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurStrengthX, sigmaY: blurStrengthY),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: glassColor.withAlpha(
              (0.15 * 256).toInt(),
            ), // Adjust opacity for desired effect
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );
  }
}
