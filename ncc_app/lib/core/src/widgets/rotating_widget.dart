import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  final Widget child;
  final bool isRotating;
  final Duration duration; // Optional: to control rotation speed

  const RotatingWidget({
    super.key,
    required this.child,
    required this.isRotating,
    this.duration = const Duration(seconds: 6), // Default rotation duration
  });

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    if (widget.isRotating) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(RotatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isRotating != oldWidget.isRotating) {
      if (widget.isRotating) {
        _controller.repeat();
      } else {
        _controller.stop();
        // Optionally reset to 0 turns when stopping
        // _controller.value = 0;
      }
    }
    // If duration changes, update the controller's duration
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
      // If it was rotating, restart with new duration
      if (widget.isRotating) {
        _controller.repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller, child: widget.child);
  }
}
