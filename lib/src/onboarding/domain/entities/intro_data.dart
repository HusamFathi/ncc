import 'package:equatable/equatable.dart';

import 'onboarding_slide.dart';

class IntroData extends Equatable {
  final String? id;
  final List<OnboardingSlide> slides;
  const IntroData({required this.id, required this.slides});
  @override
  List<Object?> get props => [id, slides];

  /// has ID method
  bool hasId() {
    if (id == null) return false;
    return id != null || id!.isNotEmpty;
  }
}
