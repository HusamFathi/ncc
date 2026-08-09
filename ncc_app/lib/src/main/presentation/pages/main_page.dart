import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/string.dart';
import '../../../../core/injection/init_di.dart';
import '../../../../core/locale/app_localizations_helper.dart';
import '../../../../core/utils/constants.dart';
import '../../../radio/presentation/widgets/radio_widget.dart';
import '../../domain/entities/intro_slide_data.dart';
import '../blocs/intro_slides/intro_slides_bloc.dart';
import '../widgets/slider_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    //child: RadioWidget()
    final double expandedHeight = 300;
    final double collapsedHeight = 100;
    final Color baseBgColor = Theme.of(context).scaffoldBackgroundColor;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyActions: false,
                automaticallyImplyLeading: false,
                // floating: true,
                centerTitle: true,
                // snap: true,
                expandedHeight: expandedHeight,
                collapsedHeight: collapsedHeight,
                primary: true,

                backgroundColor: Theme.of(context).colorScheme.secondary,
                flexibleSpace: BlocProvider(
                  create: (context) =>
                      sl<IntroSlidesBloc>()..add(IntroSlidesStarted()),
                  child: BlocConsumer<IntroSlidesBloc, IntroSlidesState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      final List<IntroSlideData> introSlides =
                          state is IntroSlidesLoaded ? state.slides : [];
                      return FlexibleSpaceBar(
                        background: SliderWidget(
                          introSlides: introSlides,
                          isLoading: state is IntroSlidesLoading,
                        ),
                        title: Text(Tr.of(context).appName.toTitle()),
                        centerTitle: true,
                        titlePadding: EdgeInsets.all(10),
                        expandedTitleScale: 1.2,
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topLeft: Radius.circular(kRoundedCorners),
                    topRight: Radius.circular(kRoundedCorners),
                  ),
                  child: Material(color: baseBgColor, child: RadioWidget()),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: baseBgColor,
                  height: MediaQuery.sizeOf(context).height - expandedHeight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
