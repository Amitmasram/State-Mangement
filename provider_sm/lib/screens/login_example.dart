import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: "Enter Email", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: authProvider.obscureText,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: () {
                          authProvider
                              .setObscureText(!authProvider.obscureText);
                        },
                        child: Icon(authProvider.obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      hintText: "Enter Password",
                      border: const OutlineInputBorder()),
                );
              },
            ),
            const SizedBox(height: 10),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return InkWell(
                  onTap: () {
                    authProvider.login(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: authProvider.loading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Login'),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
