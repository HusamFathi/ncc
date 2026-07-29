import 'package:fpdart/fpdart.dart';

import '../failures/failures.dart';

typedef FutureOfUnit = Future<Either<Failure, Unit>>;
typedef FutureOf<T> = Future<Either<Failure, T>>;
