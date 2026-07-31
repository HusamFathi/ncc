import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/src/usecases/base_usecase.dart';
import '../../entities/intro_data.dart';
import '../../repositories/intro_data_repository.dart';

class ListIntroDataUsecaseParams extends Equatable {
  final BuildContext context;

  const ListIntroDataUsecaseParams({required this.context});

  @override
  List<Object?> get props => [context];
}

class ListIntroDataUsecase
    extends BaseUseCase<IntroData, ListIntroDataUsecaseParams> {
  final IntroDataRepository _repository;

  ListIntroDataUsecase({required this._repository});

  @override
  Future<IntroData> execute(ListIntroDataUsecaseParams params) {
    return _repository.listIntroData(context: params.context);
  }
}
