import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider_mvvm/data/app_exceptions.dart';
import 'package:provider_mvvm/data/network/base_api_service.dart';

/// A class that extends [BaseApiServices](cci:2://e:/State_mangement/provider_mvvm/lib/data/network/base_api_service.dart:5:0-18:1) and provides methods for making HTTP requests.
///
/// This class provides two methods for making HTTP requests:
/// - `getApiResponse(String url)`: Retrieves data from the specified URL using a GET request.
/// - `postApiResponse(String url, data)`: Sends data to the specified URL using a POST request.
class NetworkApiService extends BaseApiServices {
  /// Retrieves data from the specified URL using a GET request.
  ///
  /// Throws a [FetchDataException] if there is no internet connection.
  ///
  /// Returns the response from the server as a dynamic object.
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
      print(url);
    } on SocketException catch (_) {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  /// Sends data to the specified URL using a POST request.
  ///
  /// Throws a [FetchDataException] if there is no internet connection.
  ///
  /// Returns the response from the server as a dynamic object.
  @override
  Future postApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
      print(url);
    } on SocketException catch (_) {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  /// Parses the response from the server based on the status code.
  ///
  /// Throws a [BadRequestException], [UnAuthorizedException], or [FetchDataException] based on the status code.
  ///
  /// Returns the response from the server as a dynamic object.
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
