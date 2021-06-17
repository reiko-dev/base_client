class AppException implements Exception {
  final String message;
  final String prefix;
  final String ulr;

  AppException({
    required this.message,
    required this.prefix,
    required this.ulr,
  });
}

class BadRequestException extends AppException {
  BadRequestException({required String message, required String url})
      : super(message: message, prefix: 'Bad Request', ulr: url);
}

class FetchDataExpection extends AppException {
  FetchDataExpection({required String message, required String url})
      : super(message: message, prefix: 'Unable to process', ulr: url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException({required String message, required String url})
      : super(message: message, prefix: 'Api no responding', ulr: url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException({required String message, required String url})
      : super(message: message, prefix: 'UnAuthorized request', ulr: url);
}
