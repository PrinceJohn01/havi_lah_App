import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../core/homeController/home_controller.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (viewModel) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 205,
                    ),
                    Icon(
                      Icons.person,
                      size: 90,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "H A V I - L A H",
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyTextField(
                        hintText: "UserName",
                        obscureText: false,
                        controller: viewModel.userNameController),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextField(
                        hintText: "Password",
                        obscureText: true,
                        controller: viewModel.passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    MyButton(
                      text: "Login",
                      onTap: () {
                        viewModel.loginUsers(
                          showMessage: (message) {
                            AnimatedSnackBar.material(
                              message,
                              type: AnimatedSnackBarType.error,
                              duration: const Duration(seconds: 2),
                            ).show(context);
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
