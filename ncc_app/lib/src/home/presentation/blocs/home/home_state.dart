part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

//loading state
final class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

//error state
final class HomeErrorState extends HomeState {
  final String message;
  final int code;
  final Function()? onRetry;

  const HomeErrorState({
    required this.message,
    required this.code,
    required this.onRetry,
  });

  @override
  List<Object?> get props => [message, code, onRetry];
}

//loaded state
/// loaded status
enum HomeLoadedStatus { initial, inProgress, success, error }

final class HomeLoadedState extends HomeState {
  final HomeLoadedStatus status;
  final String? message;
  final String? shortMessage;
  final bool showGoToTopButton;
  final double scrollOffset;
  const HomeLoadedState({
    this.status = HomeLoadedStatus.initial,
    this.message,
    this.shortMessage,
    required this.showGoToTopButton,
    required this.scrollOffset,
  });

  @override
  List<Object?> get props => [
    status,
    message,
    shortMessage,
    showGoToTopButton,
    scrollOffset,
  ];

  HomeLoadedState copyWith({
    HomeLoadedStatus? status,
    String? message,
    String? shortMessage,
    bool? showGoToTopButton,
    double? scrollOffset,
  }) {
    return HomeLoadedState(
      status: status ?? HomeLoadedStatus.initial,
      message: message ?? this.message,
      showGoToTopButton: showGoToTopButton ?? this.showGoToTopButton,
      shortMessage: shortMessage ?? this.shortMessage,
      scrollOffset: scrollOffset ?? this.scrollOffset,
    );
  }
}
