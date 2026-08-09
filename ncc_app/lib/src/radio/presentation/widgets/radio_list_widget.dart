import 'package:flutter/material.dart';

import '../../domain/entities/radio_stream_data.dart';
import 'radio_image_rotation_widget.dart';

class RadioListWidget extends StatelessWidget {
  final RadioStreamData? radio;
  final bool? isSelected;
  final bool? isRotating;
  final void Function(RadioStreamData radio)? onTap;
  const RadioListWidget({
    super.key,
    this.radio,
    this.isSelected,
    this.onTap,
    this.isRotating,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected!,

      tileColor: Colors.transparent,
      selectedTileColor: Theme.of(context).colorScheme.primary.withAlpha(30),
      leading: RadioImageRotationWidget(
        imageUrl: radio!.imageUrl,
        isRotating: isRotating!,
      ),
      title: Text(radio!.name),
      subtitle: Text(radio!.subtitle),
      onTap: () {
        if (onTap != null) {
          onTap!(radio!);
        }
      },
    );
  }
}
