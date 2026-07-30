import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/failures/failures.dart';
import '../../../domain/entities/intro_data.dart';
import '../../../domain/usecases/intro_data/list_intro_datas_usecase.dart';

part 'list_intro_datas_event.dart';
part 'list_intro_datas_state.dart';

class ListIntroDatasBloc
    extends Bloc<ListIntroDatasEvent, ListIntroDatasState> {
  final ListIntroDatasUsecase listIntroDatas;

  ListIntroDatasBloc({required this.listIntroDatas})
    : super(ListIntroDatasInitialState()) {
    on<ListIntroDatasStarted>((event, emit) async {
      emit(ListIntroDatasLoadingState());

      Either<Failure, List<IntroData>> resultsOrError = await listIntroDatas(
        params: ListIntroDatasUsecaseParams(),
      );

      resultsOrError.fold(
        (Failure failure) {
          emit(
            ListIntroDatasErrorState(
              message: failure.message,
              code: failure.code,
              onRetry: () {
                add(ListIntroDatasLoadNextPage(page: 1));
              },
            ),
          );
        },
        (List<IntroData> results) {
          emit(
            ListIntroDatasLoadedState(
              status: ListIntroDatasLoadedStatus.success,
              sldies: results,
            ),
          );
        },
      );
    });
  }
}
