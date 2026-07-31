import 'package:equatable/equatable.dart';

import 'onboarding_slide.dart';

class IntroData extends Equatable {
  final String? id;
  final bool isSeen;
  final List<OnboardingSlide> slides;
  const IntroData({required this.id, required this.slides, required this.isSeen});
  @override
  List<Object?> get props => [id, slides, isSeen];

  /// has ID method
  bool hasId() {
    if (id == null) return false;
    return id != null || id!.isNotEmpty;
  }
}
