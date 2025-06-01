import 'package:eeve_app/custom_Widget_/Custom_button.dart';
import 'package:eeve_app/custom_Widget_/Custom_TextFiled.dart';
import 'package:eeve_app/views/create_account_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Welcome Back! 👋',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 82),
            const Text("Email", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            const TextfiledWidget(
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: 16),
            const Text("Password", style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 8),
            const TextfiledWidget(
              hintText: 'Enter your password',
              obscureText: true,
            ),

            const SizedBox(height: 48),
            SizedBox(child: CustomButton(text: 'Sign In', onPressed: () {})),
            const SizedBox(height: 302),

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateAccountView(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF1565FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
