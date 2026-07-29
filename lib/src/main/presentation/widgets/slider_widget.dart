import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ncc/core/di/init_di.dart';
import 'package:ncc/core/route/routes_config.dart';
import 'package:ncc/core/utils/constants.dart';
import 'package:ncc/src/main/domain/entities/intro_slide_data.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderWidget extends StatelessWidget {
  final List<IntroSlideData> introSlides;
  final bool isLoading;
  const SliderWidget({
    super.key,
    required this.introSlides,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,

      child: CarouselSlider(
        options: CarouselOptions(
          height: 200.0,
          autoPlay: true,
          viewportFraction: 0.8,
          aspectRatio: 9 / 16,
          enlargeFactor: 0.2,
          enlargeCenterPage: true,
        ),
        items: introSlides.map((slide) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                radius: kMediumRadius,
                onTap: () async {
                  if (slide.type == 'external') {
                    // Open external URL
                    final Uri url = Uri.parse(slide.url);

                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  } else {
                    // Navigate to internal route
                    sl<RoutesService>().goTo(context: context, path: slide.url);
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kMediumRadius),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kMediumRadius),
                    child: Image.asset(slide.image, fit: BoxFit.fill),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
