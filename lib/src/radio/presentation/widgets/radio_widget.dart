import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/src/widgets/box_layout_widget.dart';
import '../../../../core/src/widgets/errors/failure_widget.dart';
import '../../../../core/src/widgets/loading_widget.dart';
import '../../../../core/src/widgets/rotating_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/entities/radio_stream_data.dart';
import '../blocs/radio_stream/radio_stream_bloc.dart';

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
                            onRetry: () {
                              radioStreamBloc.add(RadioStreamStarted());
                            },
                            onCancel: () {
                              Navigator.of(context).pop();
                            },
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
                              return Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isDesktop
                                      ? Expanded(
                                          child: Text(
                                            currentStreamData.description,
                                          ),
                                        )
                                      : SizedBox(),
                                  Expanded(
                                    child: ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: 500,
                                      ),
                                      child: BoxLayoutWidget(
                                        orientation: BoxOrientation.vertical,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          // !isDesktop
                                          //     ? Align(
                                          //         alignment:
                                          //             Alignment.topLeft,
                                          //         child: IconButton(
                                          //           onPressed: () {
                                          //             //show about dialog
                                          //             showDialog(
                                          //               context: context,
                                          //               builder: (context) {
                                          //                 return AlertDialog(
                                          //                   title: ListTile(
                                          //                     leading: CircleAvatar(
                                          //                       backgroundImage:
                                          //                           AssetImage(
                                          //                             currentStreamData
                                          //                                 .imageUrl,
                                          //                           ),
                                          //                     ),
                                          //                     title: Text(
                                          //                       currentStreamData
                                          //                           .name,
                                          //                     ),
                                          //                   ),

                                          //                   content: Text(
                                          //                     currentStreamData
                                          //                         .description,
                                          //                   ),
                                          //                   actions: [
                                          //                     TextButton(
                                          //                       onPressed: () {
                                          //                         Navigator.of(
                                          //                           context,
                                          //                         ).pop();
                                          //                       },
                                          //                       child: Text(
                                          //                         Tr.of(context)
                                          //                             .close
                                          //                             .toTitle(),
                                          //                       ),
                                          //                     ),
                                          //                   ],
                                          //                 );
                                          //               },
                                          //             );
                                          //           },
                                          //           icon: Icon(
                                          //             Icons.more_horiz,
                                          //           ),
                                          //         ),
                                          //       )
                                          //     : SizedBox(),
                                          // ScaleAtHoverWidget(
                                          //   child: SizedBox(
                                          //     height:
                                          //         150, // Same height as the image
                                          //     child: AspectRatio(
                                          //       aspectRatio: 16 / 9,
                                          //       child: ClipRRect(
                                          //         borderRadius: BorderRadius.all(
                                          //           Radius.circular(20),
                                          //         ), // Change this value for desired roundness
                                          //         child: Image.asset(
                                          //           currentStreamData
                                          //               .backgroundLessonImageUrl,
                                          //           // fit: BoxFit.cover,
                                          //         ), // Added fit: BoxFit.cover
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Gap(kLargeGap),
                                          // ScaleAtHoverWidget(
                                          //   child: FilledButton.icon(
                                          //     // Reduce border radius for more squared corners
                                          //     style: FilledButton.styleFrom(
                                          //       backgroundColor:
                                          //           currentStreamData
                                          //               .radioPrimaryColor,
                                          //       minimumSize: const Size(
                                          //         200,
                                          //         60,
                                          //       ),
                                          //       shape: RoundedRectangleBorder(
                                          //         borderRadius:
                                          //             BorderRadius.circular(
                                          //               12,
                                          //             ), // Less roundness
                                          //       ),
                                          //     ),
                                          //     onPressed: !isLoading
                                          //         ? () {
                                          //             radioStreamBloc.add(
                                          //               RadioStreamSelectedEvent(
                                          //                 radioStreamData:
                                          //                     currentStreamData,
                                          //               ),
                                          //             );
                                          //           }
                                          //         : null,
                                          //     icon: Builder(
                                          //       builder: (context) {
                                          //         if (isLoading) {
                                          //           return SizedBox(
                                          //             width: 20,
                                          //             height: 20,
                                          //             child:
                                          //                 CircularProgressIndicator(
                                          //                   color:
                                          //                       Colors.white,
                                          //                   strokeWidth: 2,
                                          //                 ),
                                          //           );
                                          //         }
                                          //         return Icon(
                                          //           playing
                                          //               ? Icons.pause
                                          //               : Icons.play_arrow,
                                          //           color: Colors.white,
                                          //         );
                                          //       },
                                          //     ),
                                          //     label: Text(
                                          //       Tr.of(context).play.toTitle(),
                                          //       style: Theme.of(context)
                                          //           .textTheme
                                          //           .headlineSmall!
                                          //           .copyWith(
                                          //             color: Colors.white,
                                          //             fontSize: 15,
                                          //           ),
                                          //     ),
                                          //   ),
                                          // ),
                                          // Gap(kLargeGap),
                                          // Text(
                                          //   currentStreamData.name,
                                          //   style: Theme.of(context)
                                          //       .textTheme
                                          //       .headlineMedium!
                                          //       .copyWith(
                                          //         color: currentStreamData
                                          //             .radioPrimaryColor,
                                          //         fontSize: 20,
                                          //       ),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          // Gap(kSmallGap),
                                          // Text(
                                          //   currentStreamData.subtitle,
                                          //   style: Theme.of(context)
                                          //       .textTheme
                                          //       .bodyLarge!
                                          //       .copyWith(
                                          //         color: currentStreamData
                                          //             .radioPrimaryColor,
                                          //         fontSize: 16,
                                          //       ),
                                          //   textAlign: TextAlign.center,
                                          // ),
                                          // Gap(kLargeGap),
                                          ListView.separated(
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemCount: radioStreams.length,
                                            separatorBuilder:
                                                (context, index) => Divider(
                                                  color: Colors.white24,
                                                  height: 1,
                                                ),
                                            itemBuilder: (context, index) {
                                              final bool isSelected =
                                                  currentId == index;
                                              final RadioStreamData  e = radioStreams[index];
                                              return Container(
                                                decoration: isSelected
                                                    ? BoxDecoration(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                            .withAlpha(30),
                                                      )
                                                    : null,
                                                child: ListTile(
                                                  selected: isSelected,
                                                  leading: RotatingWidget(
                                                    isRotating:
                                                        playing &&
                                                        !isNotLoadingAndNotReady &&
                                                        currentId == index,
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          AssetImage(
                                                            e.imageUrl,
                                                          ),
                                                    ),
                                                  ),
                                                  title: Text(
                                                    e.name,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineSmall!
                                                        .copyWith(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        ),
                                                  ),
                                                  subtitle: Text(
                                                    e.subtitle,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                          color: Colors.white70,
                                                          fontSize: 14,
                                                        ),
                                                  ),
                                                  onTap: () {
                                                    radioStreamBloc.add(
                                                      RadioStreamSelectedEvent(
                                                        radioStreamData: e,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        return LoadingWidget();
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
