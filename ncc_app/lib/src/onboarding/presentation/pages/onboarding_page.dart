import 'dart:developer';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc/src/onboarding/presentation/pages/welcome_intro_page.dart'
    show WelcomeIntroPage;
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/injection/init_di.dart';
import '../../../../core/route/routes_config.dart';
import '../../../../core/src/widgets/loading_widget.dart';
import '../../domain/entities/onboarding_slide.dart';
import '../blocs/list_intro_datas/list_intro_data_bloc.dart';
import '../extensions/onboarding_slide_extension.dart';
import '../widgets/onboarding_slide_widget.dart';
import 'notifications_permissions_page.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, dynamic> query;
  const OnboardingPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ListIntroDataBloc>()..add(ListIntroDataStarted()),
      child: BlocConsumer<ListIntroDataBloc, ListIntroDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              bool isMobile = sizingInformation.isMobile;
              final ListIntroDataBloc bloc = context.read<ListIntroDataBloc>();
              return Scaffold(
                appBar: AppBar(
                  leading:
                      state is ListIntroDataLoadedState &&
                          (state.index > 0 && state.index < 2)
                      ? BackButton(
                          onPressed: () {
                            int newIndex = state.index - 1;
                            log('state.index ${state.index}');
                            if (state.index < 2) {
                              bloc.pageController.animateToPage(
                                newIndex,
                                curve: Curves.linear,
                                duration: Duration(seconds: 1),
                              );
                            } else {
                              bloc.concentricPageController.animateToPage(
                                newIndex - 3,
                                curve: Curves.linear,
                                duration: Duration(seconds: 1),
                              );
                            }
                            bloc.add(ListIntroDataChangeIndex(index: newIndex));
                          },
                        )
                      : null,
                ),
                extendBody: true,
                extendBodyBehindAppBar: true,
                body: Builder(
                  builder: (context) {
                    if (state is ListIntroDataLoadedState) {
                      final List<OnboardingSlide> slides =
                          state.introData.slides;
                      return PageView(
                        controller: bloc.pageController,
                        physics: NeverScrollableScrollPhysics(),
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
                            pageController: bloc.concentricPageController,
                            onChange: (page) {
                              bloc.add(
                                ListIntroDataChangeIndex(index: page + 1),
                              );
                            },
                            colors: slides.map((e) {
                              return e.getColor(context);
                            }).toList(),
                            itemCount: slides.length,
                            nextButtonBuilder: (context) {
                              return Center(
                                child: RotatedBox(
                                  quarterTurns: 2,
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                            physics: NeverScrollableScrollPhysics(),
                            onFinish: () {
                              log('we just finished');
                              bloc.add(
                                ListIntroDataToggleOnboardingIsSeenKey(),
                              );
                              sl<RoutesService>().goTo(
                                context: context,
                                path: RoutesService.mainRoute,
                              );
                            },
                            itemBuilder: (int index) {
                              final OnboardingSlide slide = slides[index];
                              return OnboardingSlideWidget(
                                image: slide.image,
                                title: slide.getLocalizedTitle(context),
                                description: slide.getLocalizedDescription(
                                  context,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    }
                    return LoadingWidget();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
