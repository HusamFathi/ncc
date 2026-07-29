
import '../../domain/entities/intro_slide_data.dart';

class IntroSlideDataModel extends IntroSlideData {
  const IntroSlideDataModel({
    required super.image,
    required super.url,
    required super.type,
  });
  //from json
  factory IntroSlideDataModel.fromJson(Map<String, dynamic> json) {
    return IntroSlideDataModel(
      image: json['image'] as String,
      url: json['url'] as String,
      type: json['type'] as String,
    );
  }
}
