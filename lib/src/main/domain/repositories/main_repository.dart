import 'package:ncc/src/main/domain/entities/intro_slide_data.dart';

abstract class MainRepository {
  Future<List<IntroSlideData>> getIntroSlides();
}
