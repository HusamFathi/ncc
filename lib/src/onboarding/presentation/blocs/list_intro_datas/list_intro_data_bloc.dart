import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/failures/failures.dart';
import '../../../domain/entities/intro_data.dart';
import '../../../domain/usecases/intro_data/list_intro_datas_usecase.dart';

part 'list_intro_data_event.dart';
part 'list_intro_data_state.dart';

class ListIntroDataBloc extends Bloc<ListIntroDataEvent, ListIntroDataState> {
  final ListIntroDataUsecase listIntroData;

  ListIntroDataBloc({required this.listIntroData})
    : super(ListIntroDataInitialState()) {
    on<ListIntroDataStarted>((event, emit) async {
      emit(ListIntroDataLoadingState());

      Either<Failure, IntroData> resultsOrError = await listIntroData(
        params: ListIntroDataUsecaseParams(),
      );

      resultsOrError.fold(
        (Failure failure) {
          emit(
            ListIntroDataErrorState(
              message: failure.message,
              code: failure.code,
              onRetry: () {
                add(ListIntroDataLoadNextPage(page: 1));
              },
            ),
          );
        },
        (IntroData results) {
          emit(
            ListIntroDataLoadedState(
              status: ListIntroDataLoadedStatus.success,
              introData: results,
            ),
          );
        },
      );
    });
  }
}
