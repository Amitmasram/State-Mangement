import 'package:provider_mvvm/data/response/status.dart';

/// Represents the response from an API call.
///
/// The [ApiResponse] class is a generic class that holds the status, data, and message of an API response.
/// It has three properties: [status] of type [Status?], [data] of type [T?], and [message] of type [String?].
///
/// The [ApiResponse] class has three factory constructors:
/// - [ApiResponse.loading()] sets the [status] property to [Status.LOADING].
/// - [ApiResponse.completed(this.data)] sets the [status] property to [Status.COMPLETED] and assigns the provided [data] to the [data] property.
/// - [ApiResponse.error()] sets the [status] property to [Status.ERROR].
///
/// The [toString] method overrides the default [toString] method and returns a string representation of the response,
/// including the [status], [message], and [data] properties.
class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  /// Initializes the properties.
  ApiResponse({this.status, this.data, this.message});

  /// Sets the [status] property to [Status.LOADING].
  ApiResponse.loading() : status = Status.LOADING;

  /// Sets the [status] property to [Status.COMPLETED] and assigns the provided [data] to the [data] property.
  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  /// Sets the [status] property to [Status.ERROR].
  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
