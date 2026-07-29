import '../entities/intro_slide_data.dart';

abstract class MainRepository {
  Future<List<IntroSlideData>> getIntroSlides();
}
