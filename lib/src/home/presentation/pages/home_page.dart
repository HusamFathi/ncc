import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:gap/gap.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/di/init_di.dart';
import '../../../../core/extensions/string.dart';
import '../../../../core/locale/app_language.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/src/entities/language.dart';
import '../../../../core/src/widgets/glass_card_widget.dart';
import '../../../../core/src/widgets/loading_widget.dart';
import '../../../../core/utils/constants.dart';
import '../../../settings/domain/entities/device_settings.dart';
import '../../../settings/presentation/blocs/device_settings/device_settings_bloc.dart';
import '../blocs/home/home_bloc.dart';
import '../widgets/language_changer_widget.dart';
import '../widgets/navigators/app_bar_navigators_widget.dart';
import '../widgets/radios_player/radios_player_button_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceSettingsBloc, DeviceSettingsState>(
      builder: (context, settingState) {
        // Renamed deviceState to settingState
        // Handle cases where settingState might not be loaded yet,
        // though your App.dart setup should ensure it's loaded.
        if (settingState is! DeviceSettingsLoadedState) {
          return const Scaffold(body: LoadingWidget());
        }
        // Use the fresh deviceSettings from the DeviceSettingsBloc's state
        final DeviceSettings deviceSettings = settingState.deviceSettings;

        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            // bool isMobile = sizingInformation.isMobile;
            // bool isTablet = sizingInformation.isTablet;
            bool isDesktop = sizingInformation.isDesktop;
            return BlocProvider(
              create: (context) =>
                  sl<HomeBloc>()..add(HomeStarted(context: context)),
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  // DeviceSettings is now taken from the outer BlocBuilder
                  final HomeBloc homeBloc = context.read<HomeBloc>();
                  final List<Widget> data = homeBloc.scrollableWidgets;

                  return Scaffold(
                    extendBodyBehindAppBar: true,
                    appBar: state is HomeLoadedState
                        ? PreferredSize(
                            preferredSize: Size.fromHeight(kToolbarHeight),

                            child: GlassCardWidget(
                              borderRadius: 0,
                              child: AppBar(
                                backgroundColor: state.scrollOffset > 0
                                    ? Theme.of(
                                        context,
                                      ).appBarTheme.backgroundColor
                                    : Colors.transparent,
                                title: Row(
                                  children: [
                                    // AppLogoWidget(
                                    //   onTap: () {
                                    //     context.read<HomeBloc>().add(
                                    //       HomeScrollViewOffsetChanged(
                                    //         index: 0,
                                    //         context: context,
                                    //       ),
                                    //     );
                                    //   },
                                    // ),
                                    Gap(kSmallGap),
                                    Text(Tr.of(context).appNameShort.toTitle()),
                                    Gap(kSmallGap),
                                    isDesktop
                                        ? const Spacer()
                                        : const SizedBox.shrink(),
                                    isDesktop
                                        ? AppBarNavigatorsWidget(
                                            goToIndex: (inex) {
                                              context.read<HomeBloc>().add(
                                                HomeScrollViewOffsetChanged(
                                                  index: inex,
                                                  context: context,
                                                ),
                                              );
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                    const Spacer(),
                                  ],
                                ),
                                automaticallyImplyLeading: false,
                                actions: [
                                  CustomPopup(
                                    arrowColor: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.surface,
                                    content: SizedBox(
                                      height: 150,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            Tr.of(context).mobileApps.toTitle(),
                                          ),

                                          Divider(),
                                          Expanded(
                                            child: Center(
                                              child: Text(
                                                '${Tr.of(context).commingSoon.toTitle()} .....',
                                              ),
                                            ),
                                          ),
                                          Gap(kSmallGap),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'assets/images/google-play.png',
                                              ),
                                              VerticalDivider(),
                                              Image.asset(
                                                'assets/images/game.png',
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: Icon(Icons.phone_android_outlined),
                                  ),

                                  LanguageChangerWidget(
                                    currentLanguageCode: sl<AppLanguage>()
                                        .getCurrentLanguage(),
                                    supportedLanguages: sl<AppLanguage>()
                                        .getAppLocals(context: context),
                                    onLanguageChanged: (Language language) {
                                      context.read<DeviceSettingsBloc>().add(
                                        DeviceSettingsUpdated(
                                          updatedSettings: deviceSettings
                                              .copyWith(
                                                // Uses fresh deviceSettings
                                                language: language.localCode,
                                              ),
                                        ),
                                      );
                                    },
                                  ),
                                  // ThemeChangerWidget(
                                  //   isDark: deviceSettings
                                  //       .isDark, // Uses fresh deviceSettings
                                  //   onChanged: () {
                                  //     // The 'deviceSettings' here is now the fresh one from BlocBuilder
                                  //     final bool newIsDark = !deviceSettings.isDark;
                                  //     log('isDark ${newIsDark ? 1 : 0}');
                                  //     context.read<DeviceSettingsBloc>().add(
                                  //       DeviceSettingsUpdated(
                                  //         updatedSettings: deviceSettings.copyWith(
                                  //           // Uses fresh deviceSettings
                                  //           themeMode: newIsDark ? 1 : 0,
                                  //         ),
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                  // !isDesktop
                                  //     ? IconButton(
                                  //         icon: const Icon(Icons.menu),
                                  //         onPressed: () {
                                  //           // homeBloc.add(HomeMenuButtonPressed());
                                  //           homeBloc.scaffoldKey.currentState
                                  //               ?.openDrawer();
                                  //         },
                                  //       )
                                  //     : const SizedBox.shrink(),
                                  Gap(kMediumGap),
                                ],
                              ),
                            ),
                          )
                        : null,
                    floatingActionButton: RadiosPlayerButtonWidget(
                      onGoToRadioWidget: () {
                        homeBloc.add(
                          HomeScrollViewOffsetChanged(
                            index:
                                1, // Assuming index 1 is for the radio section
                            context: context,
                          ),
                        );
                      },
                    ),
                    body: SingleChildScrollView(
                      key: homeBloc.homePageScrollKey,
                      controller: homeBloc.homeScrollController,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInOut,
                        child: Builder(
                          builder: (context) {
                            final List<Widget> children = [];
                            for (int i = 0; i < data.length; i++) {
                              children.add(SizedBox(child: data[i]));
                            }
                            return Column(children: children);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
