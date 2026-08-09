import 'package:flutter/material.dart';

class LiveBlinkingDotWidget extends StatefulWidget {
  const LiveBlinkingDotWidget({
    super.key,
    this.size = 10,
    this.color = Colors.red,
  });

  final double size;
  final Color color;

  @override
  State<LiveBlinkingDotWidget> createState() => _LiveBlinkingDotWidgetState();
}

class _LiveBlinkingDotWidgetState extends State<LiveBlinkingDotWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller.drive(CurveTween(curve: Curves.easeInOut)),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
      ),
    );
  }
}
