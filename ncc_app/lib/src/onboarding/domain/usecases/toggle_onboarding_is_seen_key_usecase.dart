import '../../../../core/src/entities/no_params.dart';
import '../../../../core/src/usecases/unit_base_usecase.dart';
import '../repositories/intro_data_repository.dart';

class ToggleOnboardingIsSeenKeyUsecase extends UnitBaseUseCase<NoParams> {
  final IntroDataRepository _repository;

  ToggleOnboardingIsSeenKeyUsecase({required this._repository});

  @override
  Future<void> execute(NoParams params) {
    return _repository.toggleOnboardingIsSeenKey();
  }
}
