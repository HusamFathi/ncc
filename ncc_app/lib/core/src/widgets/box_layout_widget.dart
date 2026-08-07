import 'package:flutter/material.dart';

enum BoxOrientation { horizontal, vertical }

class BoxLayoutWidget extends StatelessWidget {
  final BoxOrientation orientation;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;

  final MainAxisSize? mainAxisSize;

  final List<Widget> children;
  const BoxLayoutWidget({
    super.key,
    required this.orientation,
    required this.children,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
  });

  @override
  Widget build(BuildContext context) {
    switch (orientation) {
      case BoxOrientation.horizontal:
        return Row(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,
          children: children,
        );
      case BoxOrientation.vertical:
        return Column(
          mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
          mainAxisSize: mainAxisSize ?? MainAxisSize.max,

          children: children,
        );
    }
  }
}
