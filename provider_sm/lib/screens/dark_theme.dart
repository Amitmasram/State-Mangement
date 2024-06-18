import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/theme_changer_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    // Using Provider.of with listen set to true to rebuild the widget when the themeMode changes
    // ignore: unused_local_variable
    final themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Screen'),
      ),
      body: Consumer<ThemeChanger>(builder: (context, themeChanger, child) {
        return Column(
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themeChanger.themeMode,
              onChanged: (newValue) {
                themeChanger.setTheme(newValue);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themeChanger.themeMode,
              onChanged: (newValue) {
                themeChanger.setTheme(newValue);
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themeChanger.themeMode,
              onChanged: (newValue) {
                themeChanger.setTheme(newValue);
              },
            ),
            const Icon(Icons.favorite),
          ],
        );
      }),
    );
  }
}
