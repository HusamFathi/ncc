part of 'list_intro_data_bloc.dart';

sealed class ListIntroDataState extends Equatable {
  const ListIntroDataState();
}

// Initial state
final class ListIntroDataInitialState extends ListIntroDataState {
  @override
  List<Object?> get props => [];
}

// Loading state
final class ListIntroDataLoadingState extends ListIntroDataState {
  @override
  List<Object?> get props => [];
}

// Error state
final class ListIntroDataErrorState extends ListIntroDataState {
  final String message;
  final int code;
  final Function()? onRetry;

  const ListIntroDataErrorState({
    required this.message,
    required this.code,
    required this.onRetry,
  });

  @override
  List<Object?> get props => [message, code, onRetry];
}

// Loaded state
enum ListIntroDataLoadedStatus { initial, inProgress, success, error }

final class ListIntroDataLoadedState extends ListIntroDataState {
  final ListIntroDataLoadedStatus status;
  final String? message;
  final String? shortMessage;
  final IntroData introData;

  const ListIntroDataLoadedState({
    this.status = ListIntroDataLoadedStatus.initial,
    this.message,
    this.shortMessage,
    required this.introData, // Required parameter for PagingState
  });

  @override
  List<Object?> get props => [status, message, shortMessage, introData]; // Include pagingState in props

  ListIntroDataLoadedState copyWith({
    ListIntroDataLoadedStatus? status,
    String? message,
    String? shortMessage,
    IntroData? introData,
  }) {
    return ListIntroDataLoadedState(
      status: status ?? this.status,
      message: message ?? this.message,
      shortMessage: shortMessage ?? this.shortMessage,
      introData:
          introData ?? this.introData, // Update copying logic for PagingState
    );
  }
}
