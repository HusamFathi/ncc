part of 'radio_stream_bloc.dart';

sealed class RadioStreamEvent extends Equatable {
  const RadioStreamEvent();
}

// load config
final class RadioStreamStarted extends RadioStreamEvent {
  const RadioStreamStarted();

  @override
  List<Object?> get props => [];
}

final class RadioStreamSelectedEvent extends RadioStreamEvent {
  final RadioStreamData radioStreamData;

  const RadioStreamSelectedEvent({required this.radioStreamData});

  @override
  List<Object?> get props => [radioStreamData];
}
