import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/routes/routes_name.dart';
import '../view-model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  userPref.removeUser().then((value) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, RoutesName.login, (route) => false);
                  });
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
