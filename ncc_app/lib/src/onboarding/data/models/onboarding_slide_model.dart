import '../../domain/entities/onboarding_slide.dart';

class OnboardingSlideModel extends OnboardingSlide {
  const OnboardingSlideModel({
    required super.color,
    required super.title,
    required super.description,
    required super.image,
  });

  factory OnboardingSlideModel.fromJson(Map<String, dynamic> json) {
    return OnboardingSlideModel(
      color: json['color'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color': color,
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
