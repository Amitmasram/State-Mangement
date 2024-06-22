// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/utils/routes/routes.dart';
import 'package:provider_mvvm/utils/routes/routes_name.dart';
import 'package:provider_mvvm/view-model/user_view_model.dart';

import 'view-model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  // Builds and returns a MaterialApp widget with the title
  //'Flutter Demo' and a custom theme using ThemeData with ColorScheme from a seed color of Colors.deepPurple
  // and useMaterial3 set to true. The MaterialApp's home is set to a const MyHomePage widget.
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue,
              accentColor: Colors.orange,
            ),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
            ),
            textTheme: const TextTheme(
              headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            ),
          ),
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        ));
  }
}
