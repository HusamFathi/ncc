import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/utils/constants.dart';
import '../../../radio/presentation/blocs/radio_stream/radio_stream_bloc.dart';
import '../../domain/entities/device_settings.dart';
import '../blocs/device_settings/device_settings_bloc.dart';

class RadioSoundVolumeWidget extends StatelessWidget {
  const RadioSoundVolumeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceSettingsBloc deviceSettingsBloc = context
        .read<DeviceSettingsBloc>();
    final RadioStreamBloc radioStreamBloc = context.read<RadioStreamBloc>();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: deviceSettingsBloc),
        BlocProvider.value(value: radioStreamBloc),
      ],
      child: BlocConsumer<DeviceSettingsBloc, DeviceSettingsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListTile(
            leading: Icon(Icons.volume_up),
            title: Text(Tr.of(context).radioVolume),

            trailing: Builder(
              builder: (context) {
                if (state is DeviceSettingsLoadedState) {
                  DeviceSettings deviceSettings = state.deviceSettings;
                  double volume = deviceSettings.radioVolume;
                  return Text(
                    '${(volume * 100).toStringAsFixed(2)}%',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                }
                return SizedBox();
              },
            ),
            onTap: () {
              if (state is DeviceSettingsLoadedState) {
                DeviceSettings deviceSettings = state.deviceSettings;
                double volume = deviceSettings.radioVolume;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(Tr.of(context).setUpRadioVolumeLevel),
                    content: StreamBuilder(
                      stream: radioStreamBloc.audioPlayer.volumeStream,
                      builder: (context, asyncSnapshot) {
                        return Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          children: [
                            Text(Tr.of(context).setUpRadioVolumeLevelMessage),
                            Gap(kMediumGap),
                            Slider(
                              value: radioStreamBloc.audioPlayer.volume,
                              onChanged: (value) {
                                radioStreamBloc.audioPlayer.setVolume(value);
                              },
                              onChangeEnd: (value) {
                                deviceSettingsBloc.add(
                                  DeviceSettingsUpdated(
                                    updatedSettings: deviceSettings.copyWith(
                                      radioVolume: value,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    actions: [
                      FilledButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(Tr.of(context).ok),
                      ),
                    ],
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
