import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fpdart/fpdart.dart';
import 'package:ncc/core/src/entities/no_params.dart';

import '../../../../../core/failures/failures.dart';
import '../../../../../core/route/routes_config.dart';
import '../../../domain/entities/intro_data.dart';
import '../../../domain/usecases/intro_data/list_intro_datas_usecase.dart';
import '../../../domain/usecases/toggle_onboarding_is_seen_key_usecase.dart';

part 'list_intro_data_event.dart';
part 'list_intro_data_state.dart';

class ListIntroDataBloc extends Bloc<ListIntroDataEvent, ListIntroDataState> {
  final ListIntroDataUsecase listIntroData;
  final ToggleOnboardingIsSeenKeyUsecase toggleOnboardingIsSeenKey;
  final PageController pageController = PageController();
  ListIntroDataBloc({
    required this.listIntroData,
    required this.toggleOnboardingIsSeenKey,
  }) : super(ListIntroDataInitialState()) {
    on<ListIntroDataStarted>((event, emit) async {
      emit(ListIntroDataLoadingState());

      Either<Failure, IntroData> resultsOrError = await listIntroData(
        params: ListIntroDataUsecaseParams(context: event.context),
      );

      resultsOrError.fold(
        (Failure failure) {
          emit(
            ListIntroDataErrorState(
              message: failure.message,
              code: failure.code,
              onRetry: () {
                add(ListIntroDataStarted(context: event.context));
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

    on<ListIntroDataChangeIndex>((event, emit) {
      pageController.animateToPage(
        event.index,
        duration: Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    });
    on<ListIntroDataToggleOnboardingIsSeenKey>((event, emit) async {
      final Either<Failure, Unit> resultsOrError =
          await toggleOnboardingIsSeenKey(params: NoParams());
    });
  }
}
