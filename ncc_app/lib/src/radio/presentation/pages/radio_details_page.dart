import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ncc/core/utils/constants.dart';
import 'package:ncc/src/radio/domain/entities/radio_stream_data.dart';

import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/src/widgets/live_blinking_dot_widget.dart';
import '../blocs/radio_stream/radio_stream_bloc.dart';
import '../widgets/radio_stream_controller_widget.dart';

class RadioDetailsPage extends StatelessWidget {
  final List<RadioStreamData> radioStreams;
  final int currentId;
  const RadioDetailsPage({
    super.key,
    required this.currentId,
    required this.radioStreams,
  });

  @override
  Widget build(BuildContext context) {
    double imageDimension = math.min(
      300,
      MediaQuery.sizeOf(context).width - 40,
    );
    RadioStreamBloc radioStreamBloc = context.read<RadioStreamBloc>();
    final bool isRtl = Directionality.of(context) == TextDirection.rtl;
    final AudioPlayer audioPlayer = radioStreamBloc.audioPlayer;
    final int? currentId = radioStreamBloc.audioPlayer.currentIndex;
    if (currentId == null) {
      return SizedBox();
    }
    RadioStreamData radio = radioStreams[currentId];
    bool playing = audioPlayer.playerState.playing;

    return StreamBuilder(
      stream: audioPlayer.playerStateStream,
      builder: (context, asyncSnapshot) {
        return Scaffold(
          appBar: AppBar(centerTitle: true, title: Text(radio.name)),
          body: Padding(
            padding: const EdgeInsets.all(kSmallPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: imageDimension,
                      height: imageDimension,
                      child: Hero(
                        tag: radioTagString,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kRoundedCorners),
                          child: CachedNetworkImage(
                            imageUrl: radio.imageUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(kMediumGap),
                  Text(
                    radio.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: radio.radioPrimaryColor,
                    ),
                  ),
                  Gap(kSmallGap),
                  Text(
                    radio.subtitle,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: radio.radioPrimaryColor,
                    ),
                  ),
                  Gap(kMediumGap),
                  Row(
                    mainAxisAlignment: .spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: currentId != 0
                            ? () {
                                radioStreamBloc.add(
                                  RadioStreamGoToEvent(index: currentId - 1),
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
                                  RadioStreamGoToEvent(index: currentId + 1),
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
                  Gap(kMediumGap),
                  Row(
                    children: [
                      LiveBlinkingDotWidget(),
                      Gap(kSmallGap),
                      Text(Tr.of(context).live),
                    ],
                  ),
                  Gap(kMediumGap),
                  Card.filled(
                    child: Padding(
                      padding: const EdgeInsets.all(kMediumPadding),
                      child: Text(radio.description),
                    ),
                  ),
                  Gap(kLargeGap),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
