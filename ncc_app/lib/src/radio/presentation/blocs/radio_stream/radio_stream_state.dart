part of 'radio_stream_bloc.dart';

sealed class RadioStreamState extends Equatable {
  const RadioStreamState();
}

final class RadioStreamInitialState extends RadioStreamState {
  @override
  List<Object?> get props => [];
}

//loading state
final class RadioStreamLoadingState extends RadioStreamState {
  @override
  List<Object?> get props => [];
}

//error state
final class RadioStreamErrorState extends RadioStreamState {
  final String message;
  final int code;
  final Function()? onRetry;

  const RadioStreamErrorState({
    required this.message,
    required this.code,
    required this.onRetry,
  });

  @override
  List<Object?> get props => [message, code, onRetry];
}

//loaded state
/// loaded status
enum RadioStreamLoadedStatus { initial, inProgress, success, error }

final class RadioStreamLoadedState extends RadioStreamState {
  final RadioStreamLoadedStatus status;
  final String? message;
  final String? shortMessage;
  final List<RadioStreamData> radioStreams;

  const RadioStreamLoadedState({
    this.status = RadioStreamLoadedStatus.initial,
    this.message,
    this.shortMessage,
    required this.radioStreams,
  });

  @override
  List<Object?> get props => [status, message, shortMessage, radioStreams];

  RadioStreamLoadedState copyWith({
    RadioStreamLoadedStatus? status,
    String? message,
    String? shortMessage,
    List<RadioStreamData>? radioStreams,
  }) {
    return RadioStreamLoadedState(
      status: status ?? RadioStreamLoadedStatus.initial,
      message: message ?? this.message,
      shortMessage: shortMessage ?? this.shortMessage,
      radioStreams: radioStreams ?? this.radioStreams,
    );
  }

  RadioStreamData getCurrentStreamData({required int currentId}) {
    RadioStreamData? foundSelectedStream;
    for (final streamItem in radioStreams) {
      if (int.parse(streamItem.id) == currentId) {
        foundSelectedStream = streamItem;
        break;
      }
    }
    foundSelectedStream ??= radioStreams.first;
    return foundSelectedStream;
  }
}
