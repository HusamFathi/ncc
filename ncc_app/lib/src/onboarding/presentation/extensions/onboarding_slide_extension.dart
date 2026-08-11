import 'package:flutter/material.dart';

import '../../../../core/locale/app_localizations_helper.dart';
import '../../domain/entities/onboarding_slide.dart';

extension OnboardingSlideExtension on OnboardingSlide {
  String getLocalizedTitle(BuildContext context) {
    return _localizedValue(context, title);
  }

  String getLocalizedDescription(BuildContext context) {
    return _localizedValue(context, description);
  }

  Color getColor(BuildContext context) {
    return color;
  }

  String _localizedValue(BuildContext context, String key) {
    final tr = Tr.of(context);

    switch (key) {
      case 'appName':
        return tr.appName;
      case 'onboardingWelcomeDescription':
        return tr.onboardingWelcomeDescription;
      case 'onboardingVisionTitle':
        return tr.onboardingVisionTitle;
      case 'onboardingVisionDescription':
        return tr.onboardingVisionDescription;
      case 'onboardingMissionTitle':
        return tr.onboardingMissionTitle;
      case 'onboardingMissionDescription':
        return tr.onboardingMissionDescription;
      case 'onboardingGoalsTitle':
        return tr.onboardingGoalsTitle;
      case 'onboardingGoalsDescription':
        return tr.onboardingGoalsDescription;
      case 'onboardingHeritageRadioTitle':
        return tr.onboardingHeritageRadioTitle;
      case 'onboardingHeritageRadioDescription':
        return tr.onboardingHeritageRadioDescription;
      case 'onboardingNotionRadioTitle':
        return tr.onboardingNotionRadioTitle;
      case 'onboardingNotionRadioDescription':
        return tr.onboardingNotionRadioDescription;
      case 'msfSlideTitle':
        return tr.msfSlideTitle;
      case 'msfSlideDescription':
        return tr.msfSlideDescription;
      default:
        return '';
    }
  }
}
