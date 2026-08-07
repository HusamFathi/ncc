import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../../core/locale/app_localizations_helper.dart';
import '../../../../../core/src/widgets/box_layout_widget.dart';
import '../../../../../core/src/widgets/scale_at_hover_widget.dart';
import '../../../../../core/utils/constants.dart';
import '../bg/header_wave_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double headerHeight = screenWidth * 0.4125; // Original aspect ratio calculation
    const double fixedHeaderHeight = 700.0; // Define your desired fixed height

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.isMobile;
        bool isTablet = sizingInformation.isTablet;
        bool isDesktop = sizingInformation.isDesktop;
        return SizedBox(
          width: screenWidth,
          // height:
          //     fixedHeaderHeight +
          //     kToolbarHeight, // Use the fixed height for the SizedBox
          child: Stack(
            children: [
              // HeaderWaveWidget is aligned at the top center
              // Its own height will determine how it fits within the headerHeight.
              // If HeaderWaveWidget is taller than fixedHeaderHeight, it might be clipped.
              Align(
                alignment: Alignment.topCenter,
                child: // Add the CustomPaint widget to the Stack
                CustomPaint(
                  size: Size(
                    screenWidth,
                    fixedHeaderHeight,
                  ), // Pass the screenWidth and fixedHeight to the painter
                  painter: HeaderWavePainter(),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(kSmallPadding),
                  child: Padding(
                    padding: const EdgeInsets.only(top: kToolbarHeight),
                    child: SizedBox(
                      height: 500,
                      child: BoxLayoutWidget(
                        orientation: isMobile
                            ? BoxOrientation.vertical
                            : BoxOrientation.horizontal,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: isMobile
                                  ? screenWidth * 0.8
                                  : screenWidth * 0.4,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  Tr.of(context).appName.toTitle(),
                                  textAlign: TextAlign.center,

                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Gap(kSmallGap),
                                Text(
                                  Tr.of(context).appSlogan.toTitle(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Gap(kLargeGap),
                          ScaleAtHoverWidget(
                            child: SizedBox(
                              width: 250, // Same width as the image
                              height: 150, // Same height as the image
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ), // Change this value for desired roundness
                                child: Image.asset(
                                  'assets/images/ncc.jpg',
                                  fit: BoxFit.cover,
                                ), // Added fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
