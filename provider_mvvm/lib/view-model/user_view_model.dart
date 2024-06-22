import 'package:flutter/material.dart';
import 'package:provider_mvvm/model/user_model.dart';
import 'package:provider_mvvm/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    Utils.toastMessage('User found: $token');
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('token');
    notifyListeners();
    return true;
  }
}
