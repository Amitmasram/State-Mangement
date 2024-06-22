import 'package:flutter/material.dart';
import 'package:provider_mvvm/utils/routes/routes_name.dart';
import 'package:provider_mvvm/view/login_screen.dart';

import '../../view/home_screen.dart';
import '../../view/splash_screen.dart';

/// A class that handles generating routes for the app.
///
/// This class uses the MaterialPageRoute to generate routes for the app.
/// It checks the name of the route and returns the corresponding screen.
/// If no route is defined, it returns a default screen with a message.
class Routes {
  /// Generates a route based on the given RouteSettings.
  ///
  /// This function takes a RouteSettings object as input and returns a MaterialPageRoute.
  /// It checks the name of the route in the settings and returns the corresponding screen.
  /// If no route is defined, it returns a default screen with a message.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final arguments = settings.arguments;

    // Check the name of the route
    switch (settings.name) {
      // If the route is for the splash screen, return a MaterialPageRoute with the SplashScreen as the builder
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      // If no route is defined, return a MaterialPageRoute with a default screen
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
