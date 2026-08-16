import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/src/widgets/box_layout_widget.dart';
import '../../../../core/src/widgets/errors/failure_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/radio_stream_data.dart';
import '../blocs/radio_stream/radio_stream_bloc.dart';
import 'radio_list_widget.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late RadioStreamBloc radioStreamBloc; // Save a reference to the bloc

  @override
  void initState() {
    super.initState();
    // Initialize the bloc reference
    radioStreamBloc = context.read<RadioStreamBloc>();
  }

  @override
  void dispose() {
    // Use the saved reference instead of accessing context
    // radioStreamBloc.audioPlayer.dispose(); // Dispose the audio player
    // radioStreamBloc.close(); // Close the bloc
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider.value(
      value: radioStreamBloc, // Use the saved reference
      child: BlocConsumer<RadioStreamBloc, RadioStreamState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              bool isMobile = sizingInformation.isMobile;
              bool isTablet = sizingInformation.isTablet;
              bool isDesktop = sizingInformation.isDesktop;

              return ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 1100),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(
                      isMobile ? kSmallPadding : kLargePadding,
                    ),
                    child: Builder(
                      builder: (context) {
                        if (state is RadioStreamErrorState) {
                          return FailureWidget(
                            error: state.message,
                            code: state.code,
                            onRetry: state.onRetry,
                          );
                        }
                        if (state is RadioStreamLoadedState) {
                          final AudioPlayer audioPlayer =
                              radioStreamBloc.audioPlayer;

                          return StreamBuilder<PlayerState>(
                            stream: audioPlayer.playerStateStream,
                            builder: (context, asyncSnapshot) {
                              final List<RadioStreamData> radioStreams =
                                  state.radioStreams;
                              final int currentId =
                                  radioStreamBloc.audioPlayer.currentIndex ??
                                  0; // Get the current index or default to 0

                              RadioStreamData currentStreamData = state
                                  .getCurrentStreamData(currentId: currentId);
                              bool isActive =
                                  asyncSnapshot.connectionState ==
                                  ConnectionState.active;
                              bool hasError =
                                  asyncSnapshot.connectionState ==
                                  ConnectionState.none;
                              bool playing = audioPlayer.playerState.playing;
                              bool isReady =
                                  audioPlayer.playerState.processingState ==
                                  ProcessingState.ready;
                              bool isLoading =
                                  audioPlayer.playerState.processingState ==
                                  ProcessingState.loading;
                              bool isNotLoadingAndNotReady =
                                  !isReady && !isLoading;
                              return ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: 500),
                                child: BoxLayoutWidget(
                                  orientation: BoxOrientation.vertical,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: radioStreams.length,
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            color: Colors.white24,
                                            height: 1,
                                          ),
                                      itemBuilder: (context, index) {
                                        final bool isSelected =
                                            currentId == index;
                                        final RadioStreamData radioStreamData =
                                            radioStreams[index];
                                        return RadioListWidget(
                                          isSelected: isSelected,

                                          isRotating:
                                              playing &&
                                              !hasError &&
                                              !isNotLoadingAndNotReady &&
                                              currentId == index,
                                          radio: radioStreamData,
                                          onTap: (radioStreamData) {
                                            radioStreamBloc.add(
                                              RadioStreamGoToEvent(
                                                index: index,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Skeletonizer(
                          enabled: true,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 5,
                            itemBuilder: (context, index) => RadioListWidget(
                              isRotating: false,

                              isSelected: false,
                              radio: RadioStreamData.loading(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
