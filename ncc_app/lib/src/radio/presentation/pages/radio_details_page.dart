import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ncc/core/utils/constants.dart';
import 'package:ncc/src/radio/domain/entities/radio_stream_data.dart';

import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/src/widgets/live_blinking_dot_widget.dart';
import '../widgets/radio_stream_controller_widget.dart';

class RadioDetailsPage extends StatelessWidget {
  final RadioStreamData radio;
  const RadioDetailsPage({super.key, required this.radio});

  @override
  Widget build(BuildContext context) {
    double imageDimension = math.min(
      300,
      MediaQuery.sizeOf(context).width - 40,
    );
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(radio.name)),
      body: Padding(
        padding: const EdgeInsets.all(kSmallPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: imageDimension,
                  height: imageDimension,
                  child: Hero(
                    tag: radioTagString,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kRoundedCorners),
                      child: CachedNetworkImage(
                        imageUrl: radio.imageUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
              Gap(kMediumGap),
              Text(
                radio.name,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: radio.radioPrimaryColor),
              ),
              Gap(kSmallGap),
              Text(
                radio.subtitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: radio.radioPrimaryColor),
              ),
              Gap(kMediumGap),
              Row(
                children: [
                  LiveBlinkingDotWidget(),
                  Gap(kSmallGap),
                  Text(Tr.of(context).live),
                ],
              ),
              Gap(kMediumGap),
              Card.filled(
                child: Padding(
                  padding: const EdgeInsets.all(kMediumPadding),
                  child: Text(radio.description),
                ),
              ),
              Gap(kLargeGap),
            ],
          ),
        ),
      ),
    );
  }
}
