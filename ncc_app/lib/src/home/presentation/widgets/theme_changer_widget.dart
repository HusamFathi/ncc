import 'package:flutter/material.dart';

class ThemeChangerWidget extends StatefulWidget {
  final bool isDark;
  final void Function() onChanged;
  const ThemeChangerWidget({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  State<ThemeChangerWidget> createState() => _ThemeChangerWidgetState();
}

class _ThemeChangerWidgetState extends State<ThemeChangerWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call super.build to ensure keep-alive functionality
    return widget.isDark
        ? IconButton(
            key: UniqueKey(),
            onPressed: widget.onChanged,
            icon: Icon(Icons.dark_mode, size: 30),
          )
        : IconButton(
            key: UniqueKey(),
            onPressed: widget.onChanged,
            icon: Icon(Icons.light_mode, size: 30),
          );
  }
}
