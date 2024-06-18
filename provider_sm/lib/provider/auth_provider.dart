import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _obscureText = false;

  bool get obscureText => _obscureText;

  void setObscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        setLoading(false);
        // Process success
        print("successful");
        notifyListeners(); // Notify listeners if there's any state change to be updated
      } else {
        setLoading(false);
        // Process failure
        print("failed");
        notifyListeners();
      }
    } catch (e) {
      setLoading(false);
      // Handle error
      print("Error: $e");
    }
  }
}
