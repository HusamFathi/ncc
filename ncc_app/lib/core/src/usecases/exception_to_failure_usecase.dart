import 'dart:developer';

import '../../exceptions/exceptions.dart';
import '../../extensions/string.dart';
import '../../failures/failures.dart';
import '../../locale/app_localizations_helper.dart';

class ExceptionToFailureUseCase {
  Failure call({required Exception exception}) {
    log(exception.toString(), name: 'ExceptionToFailureUseCase');
    if (exception is BadRequestException) {
      log('BadRequestException ${exception.fields} ');
      return BadRequestFailure(
        fieldsErrors: exception.fields,
        message: Tr.current.badRequestException.capitalizeFirstLetter(),
      );
    } else if (exception is NoInternetConnectionException) {
      return ServerFailure(
        message: Tr.current.netWorkConnectionErrorMessage
            .capitalizeFirstLetter(),
      );
    } else if (exception is UnableToLoadInitialSettingsException) {
      return CacheFailure(message: '');
    } else if (exception is SessionExpiredException) {
      return SessionExpiredFailure(
        message: Tr.current.sessionExpiredFailureMessage
            .capitalizeFirstLetter(),
      );
    } else if (exception is ForbiddenException) {
      return ForbiddenFailure(
        message: Tr.current.forbiddenFailureMessage.capitalizeFirstLetter(),
      );
    } else if (exception is CacheException) {
      return CacheFailure(
        message: Tr.current.cacheFailure.capitalizeFirstLetter(),
      );
    } else if (exception is MetaAuthException) {
      return MetaAuthFailure(
        message: Tr.current.metaAuthErrorMessage.capitalizeFirstLetter(),
      );
    } else {
      return ServerFailure(
        message: Tr.current.unKnownErrorMessage.capitalizeFirstLetter(),
      );
    }
  }
}
