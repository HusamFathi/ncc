import 'package:equatable/equatable.dart';

import '../../../../../core/src/usecases/base_usecase.dart';
import '../../entities/intro_data.dart';
import '../../repositories/intro_data_repository.dart';

class ListIntroDataUsecaseParams extends Equatable {
  const ListIntroDataUsecaseParams();

  @override
  List<Object?> get props => [];
}

class ListIntroDataUsecase
    extends BaseUseCase<IntroData, ListIntroDataUsecaseParams> {
  final IntroDataRepository _repository;

  ListIntroDataUsecase({required this._repository});

  @override
  Future<IntroData> execute(ListIntroDataUsecaseParams params) {
    return _repository.listIntroData();
  }
}
