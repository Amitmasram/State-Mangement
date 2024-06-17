// 🚀 Welcome to Flutter UIs!
// 🌐 Connect with us on social media:
//    - Twitter: https://twitter.com/AmitMasram10
//    - Instagram: https://www.instagram.com/amit.2ix/
//    - LinkedIn: https://www.linkedin.com/Amitmasram/
//    - YouTube: https://www.youtube.com/channel/UC95U3IDgISWVeyqo4CGBywQ
// 💻 Explore the code and have fun building beautiful UIs with Flutter!

/*  For Single Provider use When only one provider is required

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => CountProvider(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const ExampleOneScreen(),
//       ),
//     );
//   }
// }
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/example_one_provider.dart';
import 'package:provider_sm/provider/favourite_provider.dart';
import 'package:provider_sm/provider/theme_changer_provider.dart';
import 'package:provider_sm/screens/dark_theme.dart';

import 'provider/count_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CountProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ExampleOneProvider(),
          ),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ],
        child: Builder(
          builder: (context) {
            final themeChanger = Provider.of<ThemeChanger>(context);
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeChanger.themeMode,
              theme: ThemeData(
                brightness: Brightness.light,
                primarySwatch: Colors.red,
              ),
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.brown,
                primaryColor: Colors.purple,
                iconTheme: IconThemeData(color: Colors.pink),
              ),
              home: const DarkThemeScreen(),
            );
          },
        ));
  }
}
