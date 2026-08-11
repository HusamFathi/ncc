part of 'list_intro_data_bloc.dart';

sealed class ListIntroDataEvent extends Equatable {
  const ListIntroDataEvent();
}

// Initial Go event
final class ListIntroDataStarted extends ListIntroDataEvent {
  const ListIntroDataStarted();

  @override
  List<Object?> get props => [];
}

// Go next page event
final class ListIntroDataChangeIndex extends ListIntroDataEvent {
  final int index;

  const ListIntroDataChangeIndex({required this.index});

  @override
  List<Object?> get props => [index];
}

// ToggleOnboardingIsSeenKeyUsecase
final class ListIntroDataToggleOnboardingIsSeenKey extends ListIntroDataEvent {
  const ListIntroDataToggleOnboardingIsSeenKey();

  @override
  List<Object?> get props => [];
}
