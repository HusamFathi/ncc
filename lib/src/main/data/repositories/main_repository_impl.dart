import 'package:ncc/src/main/data/datasources/local/main_local_data_source.dart';
import 'package:ncc/src/main/domain/entities/intro_slide_data.dart';
import 'package:ncc/src/main/domain/repositories/main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final MainLocalDataSource localDataSource;

  MainRepositoryImpl({required this.localDataSource});

  @override
  Future<List<IntroSlideData>> getIntroSlides() async {
    final slides = await localDataSource.getIntroSlides();
    return slides;
  }
}
