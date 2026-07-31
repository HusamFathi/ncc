import 'dart:developer';

import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ncc/core/route/routes_config.dart';
import 'package:ncc/core/src/widgets/loading_widget.dart';
import 'package:ncc/src/onboarding/domain/entities/onboarding_slide.dart';
import 'package:ncc/src/onboarding/presentation/pages/welcome_intro_page.dart'
    show WelcomeIntroPage;
import 'package:responsive_builder/responsive_builder.dart';

import '../../../../core/injection/init_di.dart';
import '../blocs/list_intro_datas/list_intro_data_bloc.dart';
import '../widgets/onboarding_slide_widget.dart';
import 'notifications_permissions_page.dart';

class OnboardingPage extends StatelessWidget {
  final Map<String, dynamic> query;
  const OnboardingPage({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ListIntroDataBloc>()..add(ListIntroDataStarted(context: context)),
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
                appBar: AppBar(),
                extendBody: true,
                extendBodyBehindAppBar: true,
                body: Builder(
                  builder: (context) {
                    if (state is ListIntroDataLoadedState) {
                      final List<OnboardingSlide> slides =
                          state.introData.slides;
                      return PageView(
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
                            colors: slides.map((e) {
                              return e.color;
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
                              sl<RoutesService>().goTo(
                                context: context,
                                path: RoutesService.mainRoute,
                              );
                            },
                            itemBuilder: (int index) {
                              final OnboardingSlide slide = slides[index];
                              return OnboardingSlideWidget(
                                image: slide.image,
                                title: slide.title,
                                description: slide.description,
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
