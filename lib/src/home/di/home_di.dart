import '../../../../core/di/init_di.dart';
import '../presentation/blocs/home/home_bloc.dart';

void homeDi() {
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
