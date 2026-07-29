import '../entities/radio_stream_data.dart';

abstract class RadioStreamRepository {
  /// Retrieves a list of radio stream data.
  ///
  /// Returns a [Future] that completes with a [List] of [RadioStreamData]
  /// objects representing the available radio streams.
  ///
  Future<List<RadioStreamData>> getRadioStreams();
}
