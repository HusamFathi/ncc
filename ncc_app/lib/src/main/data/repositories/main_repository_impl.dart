import '../../domain/entities/intro_slide_data.dart';
import '../../domain/repositories/main_repository.dart';
import '../datasources/local/main_local_data_source.dart';

class MainRepositoryImpl implements MainRepository {
  final MainLocalDataSource localDataSource;

  MainRepositoryImpl({required this.localDataSource});

  @override
  Future<List<IntroSlideData>> getIntroSlides() async {
    final slides = await localDataSource.getIntroSlides();
    return slides;
  }
}
