import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

const Duration _kAnimationDuration = Duration(seconds: 1);

class BaseAnimatorWidget extends StatefulWidget {
  final Widget child;
  const BaseAnimatorWidget({super.key, required this.child});

  @override
  State<BaseAnimatorWidget> createState() => _BaseAnimatorWidgetState();
}

class _BaseAnimatorWidgetState extends State<BaseAnimatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(duration: _kAnimationDuration)],
      child: widget.child,
    );
  }
}
