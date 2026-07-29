import '../../../../core/src/entities/no_params.dart';
import '../../../../core/src/usecases/base_usecase.dart';
import '../entities/intro_slide_data.dart';
import '../repositories/main_repository.dart';

class GetIntroSlidesUsecase
    extends BaseUseCase<List<IntroSlideData>, NoParams> {
  final MainRepository _mainRepository;

  GetIntroSlidesUsecase({required MainRepository mainRepository})
    : _mainRepository = mainRepository;

  @override
  Future<List<IntroSlideData>> execute(NoParams params) {
    return _mainRepository.getIntroSlides();
  }
}
