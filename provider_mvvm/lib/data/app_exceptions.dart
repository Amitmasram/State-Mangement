// This class represents an exception that can be thrown in the app.
// It takes an optional message and prefix as parameters.
class AppException implements Exception {
  final _message; // The message associated with the exception
  final _prefix; // The prefix to be added to the message

  // Constructor that initializes the message and prefix
  AppException([this._message, this._prefix]);

  // Override the toString method to return the prefix and message combined
  @override
  String toString() {
    return "$_prefix$_message";
  }
}

// This class represents an exception that occurs during data fetching.
// It takes an optional message as a parameter and adds a default prefix.
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

// This class represents an exception that occurs due to an invalid request.
// It takes an optional message as a parameter and adds a default prefix.
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid Request: ");
}

// This class represents an exception that occurs due to an unauthorized request.
// It takes an optional message as a parameter and adds a default prefix.
class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, "UnAuthorized Request: ");
}
