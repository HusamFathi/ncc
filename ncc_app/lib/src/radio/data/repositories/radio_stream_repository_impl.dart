import '../../../../core/exceptions/exceptions.dart';
import '../../domain/repositories/radio_stream_repository.dart';
import '../datasources/local/radio_stream_local_data_source.dart';
import '../models/radio_stream_data_model.dart';

class RadioStreamRepositoryImpl implements RadioStreamRepository {
  final RadioStreamLocalDataSourceImpl localDataSource;
  RadioStreamRepositoryImpl({required this.localDataSource});
  @override
  Future<List<RadioStreamDataModel>> getRadioStreams() {
    try {
      return localDataSource.getRadioStreams();
    } catch (e) {
      // Handle any exceptions that may occur
      throw LocalStorageErrorException();
    }
  }
}
