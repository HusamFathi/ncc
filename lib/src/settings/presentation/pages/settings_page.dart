import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/di/init_di.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_language.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/src/entities/language.dart';
import '../../../../core/src/widgets/app_version_widget.dart';
import '../../../../core/src/widgets/loading_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/presentation/widgets/language_changer_widget.dart';
import '../../../home/presentation/widgets/ncc_info/ncc_info_widget.dart';
import '../../domain/entities/device_settings.dart';
import '../blocs/device_settings/device_settings_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceSettingsBloc, DeviceSettingsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, settingState) {
        if (settingState is! DeviceSettingsLoadedState) {
          return const Scaffold(body: LoadingWidget());
        }
        // Use the fresh deviceSettings from the DeviceSettingsBloc's state
        final DeviceSettings deviceSettings = settingState.deviceSettings;
        return Scaffold(
          appBar: AppBar(
            title: Text(Tr.of(context).menu.toTitle()),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(kSmallPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(kSmallPadding),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/ncc-small-rounded.png',
                              height: 200,
                            ),
                            Gap(kLargeGap),
                            Text(
                              Tr.of(context).appSlogan.capitalizeFirstLetter(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(kMediumGap),
                    Text(Tr.of(context).settings.toTitle()),
                    Gap(kTinyGap),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(kSmallPadding),
                        child: Column(
                          children: [
                            LanguageChangerWidget(
                              style: LanguageChangerStyle.listTile,
                              currentLanguageCode: sl<AppLanguage>()
                                  .getCurrentLanguage(
                                    code: deviceSettings.language,
                                  ),
                              supportedLanguages: sl<AppLanguage>()
                                  .getAppLocals(context: context),
                              onLanguageChanged: (Language language) {
                                context.read<DeviceSettingsBloc>().add(
                                  DeviceSettingsUpdated(
                                    updatedSettings: deviceSettings.copyWith(
                                      // Uses fresh deviceSettings
                                      language: language.localCode,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(kMediumGap),
                    NccInfoWidget(),
                    Gap(kLargeGap),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(kSmallPadding),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  Tr.of(context)
                                      .powerBy(Tr.of(context).msfhor.toTitle())
                                      .toTitle(),
                                ),
                                Gap(5),
                                Image.asset(
                                  'assets/images/mof.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ],
                            ),
                            Gap(kTinyGap),

                            Center(child: AppVersionWidget()),
                          ],
                        ),
                      ),
                    ),

                    Gap(kLargeGap),
                    Gap(kLargeGap),
                    Gap(kLargeGap),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
