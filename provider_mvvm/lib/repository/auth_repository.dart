import 'package:provider_mvvm/data/network/base_api_service.dart';
import 'package:provider_mvvm/data/network/network_apiservice.dart';
import 'package:provider_mvvm/resources/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
