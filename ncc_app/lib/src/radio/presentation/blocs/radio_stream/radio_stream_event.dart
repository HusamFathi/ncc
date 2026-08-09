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

final class RadioStreamGoToEvent extends RadioStreamEvent {
  final int index;

  const RadioStreamGoToEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
