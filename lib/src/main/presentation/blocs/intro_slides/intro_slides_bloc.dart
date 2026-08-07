import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../../core/failures/failures.dart';
import '../../../../../core/src/entities/no_params.dart';
import '../../../domain/entities/intro_slide_data.dart';
import '../../../domain/usecases/get_intro_slides_usecase.dart';

part 'intro_slides_event.dart';
part 'intro_slides_state.dart';

class IntroSlidesBloc extends Bloc<IntroSlidesEvent, IntroSlidesState> {
  final GetIntroSlidesUsecase getIntroSlidesUsecase;
  IntroSlidesBloc({required this.getIntroSlidesUsecase})
    : super(IntroSlidesInitial()) {
    on<IntroSlidesStarted>((event, emit) async {
      emit(IntroSlidesLoading());
      Either<Failure, List<IntroSlideData>> resultsOrError =
          await getIntroSlidesUsecase(params: NoParams());

      resultsOrError.fold(
        (Failure failure) {
          emit(
            IntroSlidesError(
              message: failure.message,
              onRetry: () {
                add(IntroSlidesStarted());
              },
              errorCode: failure.code,
            ),
          );
        },
        (List<IntroSlideData> slides) {
          log('Loaded intro slides: $slides');
          emit(IntroSlidesLoaded(slides: slides));
        },
      );
    });
  }
}
