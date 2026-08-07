import '../../src/radio/data/datasources/local/radio_stream_local_data_source.dart';
import '../../src/radio/data/mappers/radio_stream_data_mapper.dart';
import '../../src/radio/data/repositories/radio_stream_repository_impl.dart';
import '../../src/radio/domain/repositories/radio_stream_repository.dart';
import '../../src/radio/domain/usecases/list_radio_streams_usecase.dart';
import '../../src/radio/presentation/blocs/radio_stream/radio_stream_bloc.dart';
import 'init_di.dart';

void radioDi() {
  sl.registerLazySingleton<RadioStreamRepository>(
    () => RadioStreamRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<ListRadioStreamsUsecase>(
    () => ListRadioStreamsUsecase(radioStreamRepository: sl()),
  );

  sl.registerLazySingleton<RadioStreamLocalDataSourceImpl>(
    () => RadioStreamLocalDataSourceImpl(),
  );

  sl.registerFactory<RadioStreamBloc>(
    () => RadioStreamBloc(listRadioStreamsUsecase: sl()),
  );
  sl.registerLazySingleton<RadioStreamDataMapper>(
    () => RadioStreamDataMapper(),
  );
}
