class CustomException implements Exception {
  /// the message to display to the user
  String message;

  /// the technical descrition of the error
  String? description;

  dynamic originalException;

  CustomException(this.message, {this.description});

  @override
  String toString() {
    return '(CustomException) msg:$message desc:$description';
  }
}

class ApiTimeoutException extends CustomException {
  ApiTimeoutException() : super('Request timed out');
}

class ApiResponseException extends CustomException {
  int statusCode;

  ApiResponseException(this.statusCode)
      : super('Something went wrong, Try again later');
}
