import '../entities/intro_data.dart';

abstract class IntroDataRepository {
  /// list [IntroDatas]
  Future<List<IntroData>> listIntroDatas();
}
