/// An abstract class that defines the interface for API services.
///
/// This class provides two methods:
/// - `getApiResponse(String url)`: Retrieves data from the specified URL using a GET request.
/// - `postApiResponse(String url, dynamic data)`: Sends data to the specified URL using a POST request.
abstract class BaseApiServices {
  /// Retrieves data from the specified URL using a GET request.
  ///
  /// [url] is the URL to send the GET request to.
  /// Returns a `Future` that completes with the response data.
  Future<dynamic> getApiResponse(String url);

  /// Sends data to the specified URL using a POST request.
  ///
  /// [url] is the URL to send the POST request to.
  /// [data] is the data to be sent in the request body.
  /// Returns a `Future` that completes with the response data.
  Future<dynamic> postApiResponse(String url, dynamic data);
}
