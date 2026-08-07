class ServerException implements Exception {}

class LocalStorageErrorException implements Exception {}

class GoogleAuthScopesException implements Exception {}

class GettingGoogleAccessTokenException implements Exception {}

class NoInternetConnectionException implements Exception {}

class InitAuthException implements Exception {}

class SessionExpiredException implements Exception {}

class SocialAuthException implements Exception {}

class BadRequestException implements Exception {
  final Map<String, List<String>> fields;

  BadRequestException({required this.fields});
}

class ForbiddenException implements Exception {}

///cache exceptions
class CacheException implements Exception {}

// facebook auth exceptions
class MetaAuthException implements Exception {}

/// can not refresh token exception
class RefreshTokenException implements Exception {}

class UnableToLoadInitialSettingsException implements Exception {
  UnableToLoadInitialSettingsException();
}

class UnknownErrorException implements Exception {
  UnknownErrorException();
}
