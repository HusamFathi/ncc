import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/injection/init_di.dart';
import '../../../../core/locale/app_language.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/route/routes_config.dart';
import '../../../../core/src/entities/language.dart';
import '../../../../core/src/widgets/app_version_widget.dart';
import '../../../../core/src/widgets/loading_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../home/presentation/widgets/language_changer_widget.dart';
import '../../../home/presentation/widgets/ncc_info/ncc_info_widget.dart';
import '../../domain/entities/device_settings.dart';
import '../blocs/device_settings/device_settings_bloc.dart';
import '../widgets/radio_sound_volume_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<DeviceSettingsBloc>(),
      child: BlocConsumer<DeviceSettingsBloc, DeviceSettingsState>(
        listener: (context, state) {},
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
                              Gap(kLargeGap),
                              Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(
                                        alpha: 0.08,
                                      ),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    'assets/images/splash.png',
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Gap(kMediumGap),

                              Text(
                                Tr.of(
                                  context,
                                ).appSlogan.capitalizeFirstLetter(),
                                style: Theme.of(context).textTheme.bodyLarge,
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
                                        language: language.localCode,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Divider(),
                              RadioSoundVolumeWidget(),
                              Divider(),

                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text(Tr.of(context).shareAppMessage),
                                onTap: () {
                                  sl<RoutesService>().goTo(
                                    context: context,
                                    path: RoutesService.shareAppRoute,
                                  );
                                },
                              ),
                              Divider(),

                              ListTile(
                                leading: Icon(Icons.facebook),
                                title: Text(
                                  Tr.of(context).openFacebookPageMessage,
                                ),
                                onTap: () async {
                                  final Uri url = Uri.parse(kFacebookPageLink);

                                  if (!await launchUrl(
                                    url,
                                    mode: LaunchMode.externalApplication,
                                  )) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(kMediumGap),
                      Text(Tr.of(context).aboutPlatform.toTitle()),
                      Gap(kTinyGap),
                      NccInfoWidget(),
                      Gap(kLargeGap),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(kSmallPadding),
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.email),
                                subtitle: Text('info@msf-hor.rog'),
                                title: Text(Tr.of(context).contactUs.toTitle()),
                                onTap: () async {
                                  final Uri emailUri = Uri(
                                    scheme: 'mailto',
                                    path: 'info@msf-hor.rog',
                                  );
                                  if (!await launchUrl(emailUri)) {
                                    throw Exception(
                                      'Could not launch $emailUri',
                                    );
                                  }
                                },
                              ),
                              Divider(),
                              ListTile(
                                subtitle: AppVersionWidget(),

                                title: Text(
                                  Tr.of(context)
                                      .powerBy(Tr.of(context).msfhor.toTitle())
                                      .toTitle(),
                                ),
                                leading: Image.asset(
                                  'assets/images/mof.png',
                                  height: 40,
                                  width: 40,
                                ),
                              ),
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
      ),
    );
  }
}
