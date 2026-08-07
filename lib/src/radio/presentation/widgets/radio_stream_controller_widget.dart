import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:ncc/src/radio/presentation/blocs/radio_stream/radio_stream_bloc.dart';

import '../../../../core/src/widgets/rotating_widget.dart';
import '../../domain/entities/radio_stream_data.dart';

class RadioStreamControllerWidget extends StatelessWidget {
  const RadioStreamControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RadioStreamBloc radioStreamBloc = context.read<RadioStreamBloc>();

    return BlocProvider.value(
      value: radioStreamBloc,
      child: BlocConsumer<RadioStreamBloc, RadioStreamState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is RadioStreamLoadedState) {
            final AudioPlayer audioPlayer = radioStreamBloc.audioPlayer;
            return StreamBuilder(
              stream: audioPlayer.playerStateStream,
              builder: (context, asyncSnapshot) {
                final List<RadioStreamData> radioStreams = state.radioStreams;
                final int? currentId = radioStreamBloc
                    .audioPlayer
                    .currentIndex; // Get the current index or default to 0
                if (currentId == null) {
                  return SizedBox();
                }
                RadioStreamData currentStreamData = state.getCurrentStreamData(
                  currentId: currentId,
                );
                bool isActive =
                    asyncSnapshot.connectionState == ConnectionState.active;
                bool hasError =
                    asyncSnapshot.connectionState == ConnectionState.none;
                bool playing = audioPlayer.playerState.playing;
                bool isReady =
                    audioPlayer.playerState.processingState ==
                    ProcessingState.ready;
                bool isLoading =
                    audioPlayer.playerState.processingState ==
                    ProcessingState.loading;
                bool isNotLoadingAndNotReady = !isReady && !isLoading;
                return LiquidGlassLens(
                  useImpellerBackdrop: true,
                  style: LiquidGlassStyle(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: math.min(
                        500,
                        MediaQuery.sizeOf(context).width - 20,
                      ),
                      maxHeight: 75,
                      minHeight: 70,
                      minWidth: 300,
                    ),
                    child: Center(
                      child: ListTile(
                        leading: RotatingWidget(
                          isRotating: playing && !isNotLoadingAndNotReady,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              currentStreamData.imageUrl,
                            ),
                          ),
                        ),
                        title: Row(children: [

                        ],),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
