import 'package:equatable/equatable.dart';

class IntroSlideData extends Equatable {
  final String image;
  final String url;
  // extrenal or internal url
  final String type;

  const IntroSlideData({
    required this.image,
    required this.url,
    required this.type,
  });

  @override
  List<Object?> get props => [image, url, type];
}
