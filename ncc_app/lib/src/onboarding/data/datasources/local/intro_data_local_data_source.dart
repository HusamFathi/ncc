import 'package:flutter/material.dart';

import '../../../../../core/services/local_storage_service.dart';
import '../../models/intro_data_model.dart';

abstract class IntroDataLocalDataSource {
  Future<IntroDataModel> listIntroData();
  Future<void> toggleOnboardingIsSeenKey();
}

class IntroDataLocalDataSourceImpl implements IntroDataLocalDataSource {
  final LocalStorageService _localStorageService;
  static const String onboardingIsSeenKey = 'onboarding_isSeen';

  IntroDataLocalDataSourceImpl({required this._localStorageService});

  @override
  Future<IntroDataModel> listIntroData() async {
    final bool isSeen =
        await _localStorageService.getBool(onboardingIsSeenKey) ?? false;
    final Map<String, dynamic> data = {
      'is_seen': isSeen,
      'id': 'xyz',
      'slides': [
        {
          'color': const Color(0xFF7C3AED),
          'title': 'appName',
          'description': 'onboardingWelcomeDescription',
          'image': 'assets/images/splash.png',
        },
        {
          'color': const Color(0xFF4F46E5),
          'title': 'onboardingVisionTitle',
          'description': 'onboardingVisionDescription',
          'image': 'assets/images/onboarding/our-vision.png',
        },
        {
          'color': const Color(0xFF2563EB),
          'title': 'onboardingMissionTitle',
          'description': 'onboardingMissionDescription',
          'image': 'assets/images/onboarding/our-mission.png',
        },
        {
          'color': const Color(0xFF059669),
          'title': 'onboardingGoalsTitle',
          'description': 'onboardingGoalsDescription',
          'image': 'assets/images/onboarding/goals.png',
        },
        {
          'color': const Color(0xFFD97706),
          'title': 'onboardingHeritageRadioTitle',
          'description': 'onboardingHeritageRadioDescription',
          'image': 'assets/images/heritage-radio-background-less.png',
        },
        {
          'color': const Color(0xFF2563EB),
          'title': 'onboardingNotionRadioTitle',
          'description': 'onboardingNotionRadioDescription',
          'image': 'assets/images/notion-radio-background-less.png',
        },
        {
          'color': const Color(0xFFDC2626),
          'title': 'msfSlideTitle',
          'description': 'msfSlideDescription',
          'image': 'assets/images/mof.png',
        },
      ],
    };

    return IntroDataModel.fromJson(data);
  }

  @override
  Future<void> toggleOnboardingIsSeenKey() async {
    final bool isSeen =
        await _localStorageService.getBool(onboardingIsSeenKey) ?? false;
    final bool newIsSeen = !isSeen;
    //save the new key
    await _localStorageService.setBool(onboardingIsSeenKey, newIsSeen);
  }
}
