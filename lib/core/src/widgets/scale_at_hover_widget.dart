import 'package:flutter/material.dart';

class ScaleAtHoverWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleFactor;

  const ScaleAtHoverWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.scaleFactor = 1.1,
  });

  @override
  State<ScaleAtHoverWidget> createState() => _ScaleAtHoverWidgetState();
}

class _ScaleAtHoverWidgetState extends State<ScaleAtHoverWidget> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedScale(
        scale: _isHovering ? widget.scaleFactor : 1.0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
