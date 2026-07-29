part of 'intro_slides_bloc.dart';

sealed class IntroSlidesEvent extends Equatable {
  const IntroSlidesEvent();

  @override
  List<Object> get props => [];
}

class IntroSlidesStarted extends IntroSlidesEvent {
  const IntroSlidesStarted();
}
