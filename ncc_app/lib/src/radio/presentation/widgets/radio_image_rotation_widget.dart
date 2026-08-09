import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/src/widgets/rotating_widget.dart';

class RadioImageRotationWidget extends StatelessWidget {
  final bool isRotating;
  final String imageUrl;

  const RadioImageRotationWidget({
    super.key,
    required this.isRotating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return RotatingWidget(
      isRotating: isRotating,
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
