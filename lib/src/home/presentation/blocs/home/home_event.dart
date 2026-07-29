part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

// load config
final class HomeStarted extends HomeEvent {
  final BuildContext context;
  const HomeStarted({required this.context});

  @override
  List<Object?> get props => [context];
}

// scroll view offset
final class HomeScrollViewOffsetChanged extends HomeEvent {
  final int index;
  final BuildContext context;

  const HomeScrollViewOffsetChanged({
    required this.context,
    required this.index,
  });

  @override
  List<Object?> get props => [context, index];
}

// frequently asked question
final class HomeFrequentlyAskedQuestionUpdated extends HomeEvent {
  @override
  List<Object?> get props => [];
}

// scroll view listener
final class HomeScrollViewListenerAdded extends HomeEvent {
  const HomeScrollViewListenerAdded();

  @override
  List<Object?> get props => [];
}
