import '../entities/intro_data.dart';

abstract class IntroDataRepository {
  /// list [IntroData]
  Future<IntroData> listIntroData();
  Future<void> toggleOnboardingIsSeenKey();
}
