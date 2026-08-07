import 'package:flutter/material.dart';

import '../entities/intro_data.dart';

abstract class IntroDataRepository {
  /// list [IntroData]
  Future<IntroData> listIntroData({required BuildContext context});
    Future<void> toggleOnboardingIsSeenKey();

}
