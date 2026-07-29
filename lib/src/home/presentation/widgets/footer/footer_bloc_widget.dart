import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/extensions/string.dart';
import '../../../../../core/locale/app_localizations_helper.dart';
import '../../../../../core/src/widgets/app_version_widget.dart';
import '../../../../../core/utils/constants.dart';
import '../bg/footer_wave_widget.dart';

class FooterBlocWidget extends StatelessWidget {
  const FooterBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // final double headerHeight = screenWidth * 0.4125; // Original aspect ratio calculation
    const double fixedHeaderHeight = 200.0; // Define your desired fixed height

    return Column(
      children: [
        Gap(kLargeGap),
        Gap(kLargeGap),
        SizedBox(
          height: fixedHeaderHeight,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: // Add the CustomPaint widget to the Stack
                CustomPaint(
                  size: Size(
                    screenWidth,
                    fixedHeaderHeight,
                  ), // Pass the screenWidth and fixedHeight to the painter
                  painter: FooterWavePainter(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: // Add the CustomPaint widget to the Stack
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            Tr.of(context)
                                .powerBy(Tr.of(context).msfhor.toTitle())
                                .toTitle(),
                          ),
                          Gap(5),
                          Image.asset(
                            'assets/images/mof.png',
                            height: 20,
                            width: 20,
                          ),
                        ],
                      ),
                      Gap(kMediumGap),
                      Text(
                        Tr.of(context)
                            .autobotsCopyRights(
                              Tr.of(context).appName.toTitle(),
                              DateTime.now().year.toString(),
                            )
                            .toTitle(),
                      ),
                      AppVersionWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
