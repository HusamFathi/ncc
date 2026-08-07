import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../../core/src/widgets/scale_at_hover_widget.dart';
import '../../../../../core/utils/constants.dart';

class InfoCardWidget extends StatelessWidget {
  const InfoCardWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ScaleAtHoverWidget(
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(kMediumPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toTitle(),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
                Gap(kMediumGap),
                Text(description.capitalizeFirstLetter()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
