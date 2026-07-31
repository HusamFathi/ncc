import 'package:flutter/material.dart';
import 'package:ncc/core/locale/app_localizations_helper.dart';
import 'package:ncc/core/utils/constants.dart';

import '../../../../../core/services/local_storage_service.dart';
import '../../../domain/entities/onboarding_slide.dart';
import '../../models/intro_data_model.dart';

abstract class IntroDataLocalDataSource {
  Future<IntroDataModel> listIntroData({required BuildContext context});
}

class IntroDataLocalDataSourceImpl implements IntroDataLocalDataSource {
  final LocalStorageService _localStorageService;
  static const String _storageKey = 'intro_data';

  IntroDataLocalDataSourceImpl({required this._localStorageService});

  @override
  Future<IntroDataModel> listIntroData({required BuildContext context}) async {
    return IntroDataModel(
      id: 'xyz',
      slides: [
       OnboardingSlide(
          color: const Color(0xFF7C3AED), // Welcome - Rich Purple
          title: Tr.of(context).appName,
          description: Tr.of(context).onboardingWelcomeDescription,
          image: 'assets/images/onboarding/ncc.png',
        ),

        OnboardingSlide(
          color: const Color(0xFF4F46E5), // Vision - Indigo
          title: Tr.of(context).onboardingVisionTitle,
          description: Tr.of(context).onboardingVisionDescription,
          image: 'assets/images/onboarding/our-vision.png',
        ),

        OnboardingSlide(
          color: const Color(0xFF2563EB), // Mission - Blue
          title: Tr.of(context).onboardingMissionTitle,
          description: Tr.of(context).onboardingMissionDescription,
          image: 'assets/images/onboarding/our-mission.png',
        ),

        OnboardingSlide(
          color: const Color(0xFF059669), // Goals - Emerald
          title: Tr.of(context).onboardingGoalsTitle,
          description: Tr.of(context).onboardingGoalsDescription,
          image: 'assets/images/onboarding/goals.png',
        ),

        OnboardingSlide(
          color: const Color(0xFFD97706), // Heritage - Amber
          title: Tr.of(context).onboardingHeritageRadioTitle,
          description: Tr.of(context).onboardingHeritageRadioDescription,
          image: 'assets/images/onboarding/heritage.png',
        ),

        OnboardingSlide(
          color: const Color(0xFF2563EB), // Notion Radio - Royal Blue
          title: Tr.of(context).onboardingNotionRadioTitle,
          description: Tr.of(context).onboardingNotionRadioDescription,
          image: 'assets/images/onboarding/notion.png',
        ),

        OnboardingSlide(
          color: const Color(0xFFDC2626), // MSF - Crimson
          title: Tr.of(context).msfSlideTitle,
          description: Tr.of(context).msfSlideDescription,
          image: 'assets/images/onboarding/msf-hor.png',
        ),
      ],
    );
  }
}
