part of 'radio_stream_bloc.dart';

sealed class RadioStreamEvent extends Equatable {
  const RadioStreamEvent();
}

// load config
final class RadioStreamStarted extends RadioStreamEvent {
  final double initVolume;
  const RadioStreamStarted({required this.initVolume});

  @override
  List<Object?> get props => [initVolume];
}

final class RadioStreamSelectedEvent extends RadioStreamEvent {
  final RadioStreamData radioStreamData;

  const RadioStreamSelectedEvent({required this.radioStreamData});

  @override
  List<Object?> get props => [radioStreamData];
}

final class RadioStreamSkipNextEvent extends RadioStreamEvent {
  const RadioStreamSkipNextEvent();

  @override
  List<Object?> get props => [];
}

final class RadioStreamSkipPreviousEvent extends RadioStreamEvent {
  const RadioStreamSkipPreviousEvent();

  @override
  List<Object?> get props => [];
}
