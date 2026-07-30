import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, dynamic> query;
  const OnboardingPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: <Color>[Colors.white, Colors.blue, Colors.red],
        itemCount: 10, // null = infinity
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (int index) {
          return Center(child: Text('Page $index'));
        },
      ),
    );
  }
}
