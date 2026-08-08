import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';

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
      log('DeviceSettingsStarted $RadioStreamStarted');

      audioPlayer = AudioPlayer();
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
                  add(RadioStreamStarted(initVolume: event.initVolume)),
            ),
          );
        },
        (List<RadioStreamData> radioStreams) async {
          List<AudioSource> audioSources = [];
          for (RadioStreamData stream in radioStreams) {
            // Resolve the artwork URI: copy asset images to a temp file so
            // just_audio_background can serve them via a file:// URI without
            // needing HTTP. Remote URLs are used directly.
            final Uri? artUri = await _resolveArtUri(stream.imageUrl);
            audioSources.add(
              AudioSource.uri(
                Uri.parse(stream.streamUrl),
                tag: MediaItem(
                  id: stream.id,
                  title: stream.name,
                  artist: stream.subtitle,
                  artUri: artUri,
                ),
              ),
            );
          }
          try {
            await audioPlayer.setAudioSources(audioSources);
            await audioPlayer.setVolume(event.initVolume);
          } catch (e) {
            // Gracefully handle network errors (e.g. 502 Bad Gateway) so the
            // app stays functional; the user can retry playback manually.
            log('Error initialising audio sources: $e');
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
        }
        if (audioPlayer.playing) {
          audioPlayer.pause();
        } else {
          await audioPlayer.play();
        }
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.initial));
      }
    });
    on<RadioStreamSkipNextEvent>((event, emit) async {
      log('RadioStreamSkipNextEvent $RadioStreamSkipNextEvent');

      if (state is RadioStreamLoadedState) {
        final RadioStreamLoadedState loadedState =
            state as RadioStreamLoadedState;
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.inProgress));
        final int currentStreamId = (audioPlayer.currentIndex ?? 1);
        log('currentStreamId $currentStreamId');

        if (currentStreamId + 1 == loadedState.radioStreams.length) return;

        final int newTargetIndex = currentStreamId + 1;
        log('newTargetIndex $newTargetIndex');
        if (currentStreamId != newTargetIndex) {
          audioPlayer.pause();
          await audioPlayer.seek(Duration.zero, index: newTargetIndex);
        }
        if (audioPlayer.playing) {
          audioPlayer.pause();
        } else {
          await audioPlayer.play();
        }
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.initial));
      }
    });
    on<RadioStreamSkipPreviousEvent>((event, emit) async {
      if (state is RadioStreamLoadedState) {
        final RadioStreamLoadedState loadedState =
            state as RadioStreamLoadedState;
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.inProgress));
        final int currentStreamId = (audioPlayer.currentIndex ?? 1);
        if (currentStreamId == 0) return;
        final int newTargetIndex = currentStreamId - 1;

        if (currentStreamId != newTargetIndex) {
          audioPlayer.pause();
          await audioPlayer.seek(Duration.zero, index: newTargetIndex);
        }
        if (audioPlayer.playing) {
          audioPlayer.pause();
        } else {
          await audioPlayer.play();
        }
        emit(loadedState.copyWith(status: RadioStreamLoadedStatus.initial));
      }
    });
  }

  /// Resolves an artwork URI for [just_audio_background]:
  /// - Asset paths  → copied to a temp file and returned as a `file://` URI
  ///   so the notification system can load them without HTTP.
  /// - Remote URLs  → returned as-is.
  /// - On any error → returns null (notification shows without artwork).
  Future<Uri?> _resolveArtUri(String imageUrl) async {
    try {
      if (imageUrl.startsWith('assets/')) {
        // Build a stable temp-file name based on the asset path so we only
        // write the file once per app session (subsequent calls reuse it).
        final tempDir = await getTemporaryDirectory();
        final fileName = imageUrl.replaceAll('/', '_').replaceAll(' ', '_');
        final file = File('${tempDir.path}/$fileName');

        if (!await file.exists()) {
          final byteData = await rootBundle.load(imageUrl);
          await file.writeAsBytes(byteData.buffer.asUint8List());
        }

        return Uri.file(file.path);
      } else {
        return Uri.tryParse(imageUrl);
      }
    } catch (e) {
      log('Failed to resolve artUri for "$imageUrl": $e');
      return null;
    }
  }
}
