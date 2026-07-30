part of 'list_intro_datas_bloc.dart';

sealed class ListIntroDatasState extends Equatable {
  const ListIntroDatasState();
}

// Initial state
final class ListIntroDatasInitialState extends ListIntroDatasState {
  @override
  List<Object?> get props => [];
}

// Loading state
final class ListIntroDatasLoadingState extends ListIntroDatasState {
  @override
  List<Object?> get props => [];
}

// Error state
final class ListIntroDatasErrorState extends ListIntroDatasState {
  final String message;
  final int code;
  final Function()? onRetry;

  const ListIntroDatasErrorState({
    required this.message,
    required this.code,
    required this.onRetry,
  });

  @override
  List<Object?> get props => [message, code, onRetry];
}

// Loaded state
enum ListIntroDatasLoadedStatus { initial, inProgress, success, error }

final class ListIntroDatasLoadedState extends ListIntroDatasState {
  final ListIntroDatasLoadedStatus status;
  final String? message;
  final String? shortMessage;
  final List<IntroData> sldies;

  const ListIntroDatasLoadedState({
    this.status = ListIntroDatasLoadedStatus.initial,
    this.message,
    this.shortMessage,
    required this.sldies, // Required parameter for PagingState
  });

  @override
  List<Object?> get props => [status, message, shortMessage, sldies]; // Include pagingState in props

  ListIntroDatasLoadedState copyWith({
    ListIntroDatasLoadedStatus? status,
    String? message,
    String? shortMessage,
    List<IntroData>? sldies,
  }) {
    return ListIntroDatasLoadedState(
      status: status ?? this.status,
      message: message ?? this.message,
      shortMessage: shortMessage ?? this.shortMessage,
      sldies: sldies ?? this.sldies, // Update copying logic for PagingState
    );
  }
}
