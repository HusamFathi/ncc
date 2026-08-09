import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../core/src/widgets/rotating_widget.dart';
import '../../../../radio/domain/entities/radio_stream_data.dart';
import '../../../../radio/presentation/blocs/radio_stream/radio_stream_bloc.dart';

class RadiosPlayerButtonWidget extends StatelessWidget {
  final void Function() onGoToRadioWidget;
  const RadiosPlayerButtonWidget({super.key, required this.onGoToRadioWidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RadioStreamBloc>(),
      child: BlocConsumer<RadioStreamBloc, RadioStreamState>(
        listener: (context, state) {},
        builder: (context, state) {
          final RadioStreamBloc bloc = context.read<RadioStreamBloc>();
          if (state is RadioStreamLoadedState) {
            final AudioPlayer audioPlayer = bloc.audioPlayer;

            return StreamBuilder(
              stream: audioPlayer.playerStateStream,
              builder: (context, asyncSnapshot) {
                final RadioStreamData currentRadioStream = state
                    .getCurrentStreamData(
                      currentId: audioPlayer.currentIndex ?? 0,
                    );
                bool isOn = audioPlayer.playerState.playing;
                final bool playing = audioPlayer.playerState.playing;
                bool isReady =
                    audioPlayer.playerState.processingState ==
                    ProcessingState.ready;
                bool isLoading =
                    audioPlayer.playerState.processingState ==
                    ProcessingState.loading;
                bool isNotLoadingAndNotReady = !isReady && !isLoading;
                return FloatingActionButton.extended(
                  icon: RotatingWidget(
                    isRotating: isOn && !isNotLoadingAndNotReady,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(currentRadioStream.imageUrl),
                    ),
                  ),
                  backgroundColor: currentRadioStream.radioPrimaryColor,
                  onPressed: () {
                    // Handle button press
                    bloc.add(
                      RadioStreamGoToEvent(
                        index: audioPlayer.currentIndex ?? 0,
                      ),
                    );
                    onGoToRadioWidget();
                  },
                  label: Icon(
                    isOn ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
