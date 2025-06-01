import 'package:flutter/material.dart';
import 'package:sawwah_app/Custom_Widget_/custom_button.dart';
import 'package:sawwah_app/Custom_Widget_/CustomTextField.dart';
import 'package:sawwah_app/auth_views/signin_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/black.jpg',
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "LET'S GET YOU STARTED",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  hintText: 'Full name',
                  controller: fullNameController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Email address',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: 'sign up',
                  onPressed: () {
                    // handle sign up logic
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInView()),
                        );
                      },

                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
