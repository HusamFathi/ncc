import 'dart:developer';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc/core/extensions/string.dart';
import 'package:ncc/core/locale/app_localizations_helper.dart';
import 'package:ncc/core/route/routes_config.dart';
import 'package:ncc/src/onboarding/presentation/pages/welcome_intro_page.dart'
    show WelcomeIntroPage;
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/injection/init_di.dart';
import '../blocs/list_intro_datas/list_intro_data_bloc.dart';
import 'notifications_permissions_page.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, dynamic> query;
  const OnboardingPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ListIntroDataBloc>()..add(ListIntroDataStarted()),
      child: BlocConsumer<ListIntroDataBloc, ListIntroDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              bool isMobile = sizingInformation.isMobile;
              final ListIntroDataBloc bloc = context.read<ListIntroDataBloc>();
              return Scaffold(
                body: PageView(
                  controller: bloc.pageController,
                  children: [
                    WelcomeIntroPage(
                      goNext: () {
                        bloc.add(ListIntroDataChangeIndex(index: 1));
                      },
                      isMobile: isMobile,
                    ),
                    NotificationsPermissionsPage(
                      goNext: () {
                        bloc.add(ListIntroDataChangeIndex(index: 2));
                      },
                    ),
                    ConcentricPageView(
                      colors: <Color>[Colors.white, Colors.blue, Colors.red],
                      itemCount: 4, // null = infinity
                      nextButtonBuilder: (context) {
                        return Center(
                          child: Text(
                            Tr.of(context).next.capitalizeFirstLetter(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      },
                      physics: NeverScrollableScrollPhysics(),
                      onFinish: () {
                        log('we just finished');
                        sl<RoutesService>().goTo(context: context, path: RoutesService.mainRoute) ;
                      },
                      itemBuilder: (int index) {
                        return Center(child: Text('Page $index'));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
