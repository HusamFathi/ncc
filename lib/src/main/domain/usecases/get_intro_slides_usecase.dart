import 'package:ncc/core/src/entities/no_params.dart';
import 'package:ncc/core/src/usecases/base_usecase.dart';
import 'package:ncc/src/main/domain/entities/intro_slide_data.dart';
import 'package:ncc/src/main/domain/repositories/main_repository.dart';

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
