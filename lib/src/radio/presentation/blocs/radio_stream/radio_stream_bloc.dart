import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

import '../../../../../core/failures/failures.dart';
import '../../../../../core/src/entities/no_params.dart';
import '../../../domain/entities/radio_stream_data.dart';
import '../../../domain/usecases/list_radio_streams_usecase.dart';

part 'radio_stream_event.dart';
part 'radio_stream_state.dart';

class RadioStreamBloc extends Bloc<RadioStreamEvent, RadioStreamState> {
  final ListRadioStreamsUsecase listRadioStreamsUsecase;
  late AudioPlayer audioPlayer;
  RadioStreamBloc({required this.listRadioStreamsUsecase})
    : super(RadioStreamInitialState()) {
    on<RadioStreamStarted>((event, emit) async {
      audioPlayer = AudioPlayer();
      emit(RadioStreamLoadingState());
      Either<Failure, List<RadioStreamData>> resulsOrError =
          await listRadioStreamsUsecase(params: NoParams());

      resulsOrError.fold(
        (Failure failure) {
          emit(
            RadioStreamErrorState(
              message: failure.message,
              code: failure.code,
              onRetry: () => add(RadioStreamStarted()),
            ),
          );
        },
        (List<RadioStreamData> radioStreams) {
          List<AudioSource> audioSources = [];
          for (RadioStreamData stream in radioStreams) {
            // Convert asset image paths to just_audio_background compatible URIs
            String artUriString = stream.imageUrl;
            if (artUriString.startsWith('assets/')) {
              artUriString = 'asset:///$artUriString';
            }
            audioSources.add(
              AudioSource.uri(
                Uri.parse(stream.streamUrl),
                tag: MediaItem(
                  id: stream.id,
                  title: stream.name,
                  artist: stream.description,
                  artUri: Uri.parse(artUriString),
                ),
              ),
            );
          }
          try {
            audioPlayer.setAudioSources(audioSources);
          } catch (e) {
            log('error r 2$e');
          }
          emit(RadioStreamLoadedState(radioStreams: radioStreams));
        },
      );
    });
    on<RadioStreamSelectedEvent>((event, emit) async {
      if (state is RadioStreamLoadedState) {
        final RadioStreamLoadedState loadedState =
            state as RadioStreamLoadedState;
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.inProgress));
        final int currentStreamId = (audioPlayer.currentIndex ?? 1);
        final int newTargetIndex = int.parse(event.radioStreamData.id);

        if (currentStreamId != newTargetIndex) {
          audioPlayer.pause();
          await audioPlayer.seek(Duration.zero, index: newTargetIndex);
        } else if (audioPlayer.playing) {
          audioPlayer.pause();
        } else {
          await audioPlayer.play();
        }
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.initial));
      }
    });
  }
}
