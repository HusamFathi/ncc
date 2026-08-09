import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:liquid_glass_easy/liquid_glass_easy.dart';
import 'package:ncc/src/radio/presentation/widgets/radio_image_rotation_widget.dart';

import '../../../../core/utils/constants.dart';
import '../../domain/entities/radio_stream_data.dart';
import '../blocs/radio_stream/radio_stream_bloc.dart';
import '../pages/radio_details_page.dart';

const String radioTagString = "radio_icon";

class RadioStreamControllerWidget extends StatelessWidget {
  const RadioStreamControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RadioStreamBloc radioStreamBloc = context.read<RadioStreamBloc>();
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
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
                final int? currentId = radioStreamBloc.audioPlayer.currentIndex;
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

                return Padding(
                  padding: const EdgeInsets.only(bottom: kSmallPadding),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                                return RadioDetailsPage(
                                  currentId: currentId,
                                  radioStreams: radioStreams,
                                );
                              },
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                                final tween = Tween(
                                  begin: const Offset(0, 0.05),
                                  end: Offset.zero,
                                ).chain(CurveTween(curve: Curves.easeOut));
                                return FadeTransition(
                                  opacity: animation,
                                  child: SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  ),
                                );
                              },
                        ),
                      );
                    },
                    child: LiquidGlassLens(
                      useImpellerBackdrop: true,
                      style: LiquidGlassStyle(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: math.min(
                            300,
                            MediaQuery.sizeOf(context).width - 20,
                          ),
                          maxHeight: 70,
                          minHeight: 65,
                          minWidth: 280,
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Hero(
                              tag: radioTagString,
                              child: RadioImageRotationWidget(
                                isRotating: playing && !isNotLoadingAndNotReady,
                                imageUrl: currentStreamData.imageUrl,
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: .spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: currentId != 0
                                      ? () {
                                          radioStreamBloc.add(
                                            RadioStreamGoToEvent(
                                              index: currentId - 1,
                                            ),
                                          );
                                        }
                                      : null,
                                  icon: Transform.flip(
                                    flipX: isRtl,
                                    child: Icon(Icons.skip_previous),
                                  ),
                                ),
                                playing
                                    ? IconButton(
                                        onPressed: () {
                                          audioPlayer.pause();
                                        },
                                        icon: Icon(Icons.pause),
                                      )
                                    : IconButton(
                                        onPressed: () {
                                          audioPlayer.play();
                                        },
                                        icon: Icon(Icons.play_arrow),
                                      ),

                                IconButton(
                                  onPressed: () {
                                    audioPlayer.stop();
                                  },
                                  icon: Icon(Icons.stop, color: Colors.red),
                                ),
                                IconButton(
                                  onPressed: currentId + 1 < radioStreams.length
                                      ? () {
                                          radioStreamBloc.add(
                                            RadioStreamGoToEvent(
                                              index: currentId + 1,
                                            ),
                                          );
                                        }
                                      : null,
                                  icon: Transform.flip(
                                    flipX: isRtl,
                                    child: Icon(Icons.skip_next),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
