import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import '../../extensions/radio_stream_data_extension.dart';

import '../../../../../core/failures/failures.dart';
import '../../../../../core/src/entities/no_params.dart';
import '../../../domain/entities/radio_stream_data.dart';
import '../../../domain/usecases/list_radio_streams_usecase.dart';

part 'radio_stream_event.dart';
part 'radio_stream_state.dart';

class RadioStreamBloc extends Bloc<RadioStreamEvent, RadioStreamState> {
  final ListRadioStreamsUsecase listRadioStreamsUsecase;
  AudioPlayer? _audioPlayer;
  AudioPlayer get audioPlayer => _audioPlayer!;
  RadioStreamBloc({required this.listRadioStreamsUsecase})
    : super(RadioStreamInitialState()) {
    on<RadioStreamStarted>((event, emit) async {
      log('DeviceSettingsStarted $RadioStreamStarted');

      // Dispose any existing player before creating a new one.
      // just_audio_background only supports a single AudioPlayer instance.
      if (_audioPlayer != null) {
        await _audioPlayer!.dispose();
        _audioPlayer = null;
      }
      _audioPlayer = AudioPlayer();
      await _audioPlayer!.setVolume(event.initVolume);
      emit(RadioStreamLoadingState());
      Either<Failure, List<RadioStreamData>> resulsOrError =
          await listRadioStreamsUsecase(params: NoParams());

      await resulsOrError.fold(
        (Failure failure) async {
          emit(
            RadioStreamErrorState(
              message: failure.message,
              code: failure.code,
              onRetry: () =>
                  add(event),
            ),
          );
        },
        (List<RadioStreamData> radioStreams) async {
          List<AudioSource> audioSources = [];
          for (RadioStreamData stream in radioStreams) {
            final Uri artUri = Uri.parse(stream.imageUrl);
            audioSources.add(
              AudioSource.uri(
                Uri.parse(stream.streamUrl),
                tag: MediaItem(
                  id: stream.id,
                  title: stream.getLocalizedName(event.context),
                  artist: stream.getLocalizedSubtitle(event.context),
                  artUri: artUri,
                ),
              ),
            );
          }
          try {
            await audioPlayer.setAudioSources(audioSources);
          } catch (e) {
            // Gracefully handle network errors (e.g. 502 Bad Gateway) so the
            // app stays functional; the user can retry playback manually.
            log('Error initialising audio sources: $e');
          }
          emit(RadioStreamLoadedState(radioStreams: radioStreams));
        },
      );
    });
    on<RadioStreamGoToEvent>((event, emit) async {
      if (state is RadioStreamLoadedState) {
        final RadioStreamLoadedState loadedState =
            state as RadioStreamLoadedState;
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.inProgress));
        final int currentStreamId = (audioPlayer.currentIndex ?? 1);
        final int newTargetIndex = event.index;

        if (newTargetIndex < 0 ||
            newTargetIndex >= loadedState.radioStreams.length) {
          emit(loadedState.copyWith(status: RadioStreamLoadedStatus.initial));
          return;
        }

        if (currentStreamId != newTargetIndex) {
          audioPlayer.pause();
          await audioPlayer.seek(Duration.zero, index: newTargetIndex);
        }
        if (!audioPlayer.playing) {
          await audioPlayer.play();
        }
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.initial));
      }
    });
  }

  @override
  Future<void> close() async {
    await _audioPlayer?.dispose();
    return super.close();
  }
}
