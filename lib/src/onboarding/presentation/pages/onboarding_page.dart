import 'dart:developer';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:ncc/core/extensions/string.dart';
import 'package:ncc/core/locale/app_localizations_helper.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, dynamic> query;
  const OnboardingPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: <Color>[Colors.white, Colors.blue, Colors.red],
        itemCount: 4, // null = infinity
        nextButtonBuilder: (context) {
          return Center(
            child: Text(
              Tr.of(context).next.capitalizeFirstLetter(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          );
        },
        physics: NeverScrollableScrollPhysics(),
        onFinish: () {
          log('we just finished');
        },
        itemBuilder: (int index) {
          return Center(child: Text('Page $index'));
        },
      ),
    );
  }
}
