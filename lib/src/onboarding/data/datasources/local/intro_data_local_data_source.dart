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
      id: '',
      slides: [
        OnboardingSlide(
          color: kNCCPrimaryColor,
          title: Tr.of(context).appName,
          description: Tr.of(context).onboardingWelcomeDescription,
          image: 'assets/images/onboarding/ncc.png',
        ),
        OnboardingSlide(
          color: kNCCPrimaryColor,
          title: Tr.of(context).onboardingVisionTitle,
          description: Tr.of(context).onboardingVisionDescription,
          image: 'assets/images/onboarding/our-vision.png',
        ),
      ],
    );
  }
}
