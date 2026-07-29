
import 'package:ncc/core/di/init_di.dart';

import '../../src/main/data/datasources/local/main_local_data_source.dart';
import '../../src/main/data/repositories/main_repository_impl.dart';
import '../../src/main/domain/repositories/main_repository.dart';
import '../../src/main/domain/usecases/get_intro_slides_usecase.dart';
import '../../src/main/presentation/blocs/intro_slides/intro_slides_bloc.dart';

void mainDi() {
  sl.registerLazySingleton<GetIntroSlidesUsecase>(
    () => GetIntroSlidesUsecase(mainRepository: sl()),
  );
  sl.registerLazySingleton<MainLocalDataSource>(
    () => MainLocalDataSourceImpl(),
  );
  sl.registerFactory<IntroSlidesBloc>(
    () => IntroSlidesBloc(getIntroSlidesUsecase: sl(),
    ),
  );
  sl.registerLazySingleton<MainRepository>(
    () => MainRepositoryImpl(localDataSource: sl()),
  );
}
