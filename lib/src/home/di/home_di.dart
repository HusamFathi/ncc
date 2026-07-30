import '../../../core/injection/init_di.dart';
import '../presentation/blocs/home/home_bloc.dart';

void homeDi() {
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
