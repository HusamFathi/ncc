import '../../../../src/onboarding/data/datasources/local/intro_data_local_data_source.dart';
import '../../../../src/onboarding/data/mappers/intro_data_mapper.dart';
import '../../../../src/onboarding/data/repositories/intro_data_repository_impl.dart';
import '../../../../src/onboarding/domain/repositories/intro_data_repository.dart';
import '../../../../src/onboarding/domain/usecases/intro_data/list_intro_datas_usecase.dart';
import '../../../src/onboarding/domain/usecases/toggle_onboarding_is_seen_key_usecase.dart';
import '../../../src/onboarding/presentation/blocs/list_intro_datas/list_intro_data_bloc.dart';
import '../init_di.dart';

void introDataDI() {
  //*===========blocs====================================================

  sl.registerFactory(() => ListIntroDataBloc(listIntroData: sl(),toggleOnboardingIsSeenKey: sl()));

  //*===========usecases====================================================
  sl.registerLazySingleton(() => ListIntroDataUsecase(repository: sl()));
  sl.registerLazySingleton(() => ToggleOnboardingIsSeenKeyUsecase(repository: sl()));

  //*===========repositories====================================================
  sl.registerLazySingleton<IntroDataRepository>(
    () => IntroDataRepositoryImpl(localDataSource: sl(), networkInfo: sl()),
  );

  //*===========data sources====================================================

  sl.registerLazySingleton<IntroDataLocalDataSourceImpl>(
    () => IntroDataLocalDataSourceImpl(localStorageService: sl()),
  );

  // Example of adding a second local data source
  // sl.registerLazySingleton<SomeOtherLocalDataSource>(
  //   () => SomeOtherLocalDataSourceImpl(
  //     sharedPreferences: sl(),
  //   ),
  // );

  //*===========mappers====================================================
  sl.registerLazySingleton<IntroDataMapper>(() => IntroDataMapper());
}
