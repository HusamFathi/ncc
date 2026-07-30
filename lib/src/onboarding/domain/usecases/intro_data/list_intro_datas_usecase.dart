import 'package:equatable/equatable.dart';

import '../../../../../core/src/usecases/base_usecase.dart';
import '../../entities/intro_data.dart';
import '../../repositories/intro_data_repository.dart';

class ListIntroDatasUsecaseParams extends Equatable {
  const ListIntroDatasUsecaseParams();

  @override
  List<Object?> get props => [];
}

class ListIntroDatasUsecase
    extends BaseUseCase<List<IntroData>, ListIntroDatasUsecaseParams> {
  final IntroDataRepository _repository;

  ListIntroDatasUsecase({required this._repository});

  @override
  Future<List<IntroData>> execute(ListIntroDatasUsecaseParams params) {
    return _repository.listIntroDatas();
  }
}
