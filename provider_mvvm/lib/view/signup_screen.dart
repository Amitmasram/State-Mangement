// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/utils/routes/routes_name.dart';

import '../resources/components/round_button.dart';
import '../utils/utils.dart';
import '../view-model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Sign Up", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 26, 99, 255),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 300,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          focusNode: emailFocusNode,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            prefixIcon: Icon(Icons.email),
                          ),
                          onFieldSubmitted: (value) {
                            Utils.fieldFocusChange(
                                context, emailFocusNode, passwordFocusNode);
                          },
                        ),
                        const SizedBox(height: 20),
                        ValueListenableBuilder(
                            valueListenable: _obscurePassword,
                            builder: (context, value, child) {
                              return TextFormField(
                                focusNode: passwordFocusNode,
                                controller: passwordController,
                                obscureText: _obscurePassword.value,
                                obscuringCharacter: '*',
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  prefixIcon: const Icon(Icons.lock),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      _obscurePassword.value =
                                          !_obscurePassword.value;
                                    },
                                    child: Icon(_obscurePassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                ),
                              );
                            }),
                        SizedBox(height: height * 0.05),
                        RoundButton(
                          title: 'Sign Up',
                          loading: authViewModel.signupLoading,
                          onPress: () {
                            if (emailController.text.isEmpty) {
                              Utils.toastMessage("Email cannot be empty");
                            } else if (passwordController.text.isEmpty) {
                              Utils.toastMessage("Password cannot be empty");
                            } else if (passwordController.text.length < 6) {
                              Utils.toastMessage(
                                  'Password must be at least 6 characters');
                            } else {
                              Map data = {
                                'email': emailController.text.toString(),
                                'password': passwordController.text.toString(),
                              };
                              authViewModel.signupApi(data, context);
                              print('data : ${data.toString()}');
                              print('api hit');
                            }
                          },
                        ),
                        SizedBox(height: height * 0.05),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.login);
                          },
                          child:
                              const Text(' Already have an account ? SignIn'),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ));
  }
}
