import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final int code;

  @override
  List<Object?> get props => [message];

  const Failure({required this.code, required this.message});

  @override
  String toString() {
    return 'Failure {message: $message, code: $code}';
  }
}

class CacheFailure extends Failure {
  const CacheFailure({super.code = 100, required super.message});
}

class ServerFailure extends Failure {
  const ServerFailure({super.code = 101, required super.message});
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({super.code = 102, required super.message});
}

class GoogleTokenFailure extends Failure {
  const GoogleTokenFailure({super.code = 103, required super.message});
}

class InvalidSignInDataFailure extends Failure {
  const InvalidSignInDataFailure({super.code = 104, required super.message});
}

class BadRequestFailure extends Failure {
  final Map<String, List<String>> fieldsErrors;

  const BadRequestFailure({
    super.code = 105,
    required super.message,
    required this.fieldsErrors,
  });
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure({super.code = 106, required super.message});
}

/// failure for 403 error
class ForbiddenFailure extends Failure {
  const ForbiddenFailure({super.code = 107, required super.message});
}

// failure for error in facebook auth
class MetaAuthFailure extends Failure {
  const MetaAuthFailure({super.code = 108, required super.message});
}

class UnableToLoadInitalSettingsFailure extends Failure {
  const UnableToLoadInitalSettingsFailure({
    required super.message,
    super.code = 108,
  });
}

class UnknownErrorFailure extends Failure {
  const UnknownErrorFailure({required super.message, super.code = 109});
}
