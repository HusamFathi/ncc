import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ncc/src/settings/presentation/blocs/device_settings/device_settings_bloc.dart';

import '../../../../../core/injection/init_di.dart';
import '../../../../../core/locale/app_language.dart';
import '../../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/src/entities/language.dart';
import '../../../../core/src/widgets/base_animator_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../settings/domain/entities/device_settings.dart';

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
    final Color textColor = Theme.of(context).colorScheme.onPrimary;
    final Color bgColor = Theme.of(context).colorScheme.primary;
    final AppLanguage appLanguage = sl<AppLanguage>();
    final List<Language> languages = appLanguage.getAppLocals(context: context);
    final Language current = appLanguage.getUserLanguageFromContext(
      context: context,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        automaticallyImplyActions: false,
        title: DropdownButton<String>(
          value: current.localCode,
          iconEnabledColor: textColor,
          borderRadius: BorderRadius.all(Radius.circular(kRoundedCorners)),
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
            final DeviceSettingsBloc bloc = context.read<DeviceSettingsBloc>();

            if (bloc.state is DeviceSettingsLoadedState && value != null) {
              final DeviceSettings settings =
                  (bloc.state as DeviceSettingsLoadedState).deviceSettings;
              bloc.add(
                DeviceSettingsUpdated(
                  updatedSettings: settings.copyWith(language: value),
                ),
              );
            }
          },
        ),
      ),
      body: Container(
        color: bgColor,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            BaseAnimatorWidget(
              child: Text(
                Tr.of(context).hello.capitalizeFirstLetter(),
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge?.copyWith(color: textColor),
              ),
            ),
            Spacer(),
            Container(
              alignment: widget.isMobile
                  ? AlignmentDirectional.bottomEnd
                  : AlignmentDirectional.center,
              child: Padding(
                padding: const EdgeInsets.all(kMediumPadding),
                child: TextButton(
                  onPressed: () {
                    log('onPressed');
                    widget.goNext();
                  },
                  child: Text(
                    Tr.of(context).tabtocontinue.toTitle(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: textColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
