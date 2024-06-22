import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    try {
      final user = await getUserData();
      await Future.delayed(const Duration(seconds: 3));

      if (user.token == null || user.token == '') {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.home, (route) => false);
      }
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }
}
