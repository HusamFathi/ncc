import '../../domain/entities/intro_data.dart';
import 'onboarding_slide_model.dart';

class IntroDataModel extends IntroData {
  const IntroDataModel({
    required super.id,
    required super.slides,
    required super.isSeen,
  });

  factory IntroDataModel.fromJson(Map<String, dynamic> json) {
    return IntroDataModel(
      id: json['id'],
      isSeen: json['is_seen'],
      slides: (json['slides'] as List<dynamic>)
          .map(
            (slide) =>
                OnboardingSlideModel.fromJson(slide as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'is_seen': isSeen,
      'slides': slides
          .map(
            (slide) => OnboardingSlideModel(
              color: slide.color,
              title: slide.title,
              description: slide.description,
              image: slide.image,
            ).toJson(),
          )
          .toList(),
    };
  }
}
