import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gap/gap.dart';

import '../../../../../core/injection/init_di.dart';
import '../../../../../core/locale/app_language.dart';
import '../../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/src/entities/language.dart';
import '../../../../core/src/widgets/base_animator_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../settings/domain/entities/device_settings.dart';
import '../../../settings/presentation/blocs/device_settings/device_settings_bloc.dart';

class WelcomeIntroPage extends StatefulWidget {
  final bool isMobile;
  final void Function() goNext;
  const WelcomeIntroPage({
    super.key,
    required this.isMobile,
    required this.goNext,
  });

  @override
  State<WelcomeIntroPage> createState() => _WelcomeIntroPageState();
}

class _WelcomeIntroPageState extends State<WelcomeIntroPage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white;
    final Color bgColor = kNCCPrimaryColor;
    final AppLanguage appLanguage = sl<AppLanguage>();
    final List<Language> languages = appLanguage.getAppLocals(context: context);
    final Language current = appLanguage.getUserLanguageFromContext(
      context: context,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,

      extendBody: true,
      bottomNavigationBar: ClipRRect(
        // 3. Apply the top rounded corners
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: BottomAppBar(
          elevation: 22,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: .min,
            children: [
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    widget.goNext();
                  },
                  child: Text(
                    Tr.of(context).tapToContinue.toTitle(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: textColor),
                  ),
                ),
              ),
              Gap(kSmallGap),

              BaseAnimatorWidget(
                child: DropdownButton<String>(
                  value: current.localCode,
                  iconEnabledColor: textColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kRoundedCorners),
                  ),
                  dropdownColor: bgColor,
                  underline: Divider(color: textColor),
                  items: languages
                      .map(
                        (language) => DropdownMenuItem(
                          value: language.localCode,
                          child: Text(
                            language.getLanguageNativeName(),
                            style: TextStyle(color: textColor),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    final DeviceSettingsBloc bloc = context
                        .read<DeviceSettingsBloc>();

                    if (bloc.state is DeviceSettingsLoadedState &&
                        value != null) {
                      final DeviceSettings settings =
                          (bloc.state as DeviceSettingsLoadedState)
                              .deviceSettings;
                      bloc.add(
                        DeviceSettingsUpdated(
                          updatedSettings: settings.copyWith(language: value),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kNCCPrimaryColor, // Primary
                  Colors.white, // Secondary
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kSmallPadding),
            child: Image.asset(
              'assets/images/onboarding/welcome.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
