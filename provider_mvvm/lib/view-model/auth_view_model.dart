import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider_mvvm/repository/auth_repository.dart';
import 'package:provider_mvvm/utils/routes/routes_name.dart';
import 'package:provider_mvvm/utils/utils.dart';
import 'package:provider_mvvm/view-model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool _signupLoading = false;

  bool get signupLoading => _signupLoading;
  setSignupLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) async {
      setLoading(false);
      if (kDebugMode) {
        print(value.toString());
      }

      // Assuming `value` contains user data including token
      final userViewModel = Provider.of<UserViewModel>(context, listen: false);
      await userViewModel.saveUser(UserModel(token: value['token']));

      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (route) => false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.toastMessage(error.toString());
        print(error.toString());
      }
    });
  }

  Future<void> signupApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.signupApi(data).then((value) {
      setSignupLoading(false);
      Utils.toastMessage('Sign up successfully');
      if (kDebugMode) {
        print(value.toString());
      }
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.home, (route) => false);
    }).onError((error, stackTrace) {
      setSignupLoading(false);
      if (kDebugMode) {
        Utils.toastMessage(error.toString());
        print(error.toString());
      }
    });
  }
}
