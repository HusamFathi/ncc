import 'package:fpdart/fpdart.dart';

import '../../failures/failures.dart';
import 'exception_to_failure_usecase.dart';

/// Base class for use cases.
/// Use cases are the entry points to the domain layer.
/// the first arge is for the output and the second is for the input.
abstract class BaseUseCase<Type, Params> {
  final ExceptionToFailureUseCase exceptionToFailure =
      ExceptionToFailureUseCase();

  // Type call({required Params params});

  /// Handles exceptions thrown during use case execution.
  Failure handleFailures(Exception exception) {
    return exceptionToFailure(exception: exception);
  }

  Future<Either<Failure, Type>> call({required Params params}) async {
    try {
      final Type result = await execute(params);
      return Right(result);
    } on Exception catch (e) {
      final failure = handleFailures(e);
      return Left(failure);
    }
  }

  Future<Type> execute(Params params);
}
