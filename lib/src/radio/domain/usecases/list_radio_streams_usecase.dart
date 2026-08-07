import '../../../../core/src/entities/no_params.dart';
import '../../../../core/src/usecases/base_usecase.dart';
import '../entities/radio_stream_data.dart';
import '../repositories/radio_stream_repository.dart';

class ListRadioStreamsUsecase
    extends BaseUseCase<List<RadioStreamData>, NoParams> {
  final RadioStreamRepository _radioStreamRepository;

  ListRadioStreamsUsecase({required this._radioStreamRepository});

  @override
  Future<List<RadioStreamData>> execute(NoParams params) {
    return _radioStreamRepository.getRadioStreams();
  }
}
