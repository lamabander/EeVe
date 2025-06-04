import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawwah_app/Custom_Widget_/CustomTextField.dart';
import 'package:sawwah_app/Custom_Widget_/Custom_button.dart';
import 'package:sawwah_app/auth_views/signin_view.dart';
import 'package:sawwah_app/auth_views/verification_code_view.dart';
import 'package:sawwah_app/main.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Create Your Account',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 82),
                const Text(
                  "Full Name",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Enter your name',
                  keyboardType: TextInputType.name,
                  controller: nameController,
                ),
                const SizedBox(height: 16),
                const Text("Email", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                const Text("Password", style: TextStyle(color: Colors.white70)),
                const SizedBox(height: 8),
                CustomTextField(
                  hintText: 'Enter your password',
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 48),
                SizedBox(
                  child: CustomButton(
                    text: 'Sign Up',
                    onPressed: () async {
                      final email = emailController.text.trim();
                      final name = nameController.text.trim();
                      final password = passwordController.text.trim();

                      if (email.isEmpty || name.isEmpty || password.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all fields"),
                          ),
                        );
                        return;
                      }

                      try {
                        final response = await supabase.auth.signUp(
                          email: email,
                          password: password,
                        );

                        final user = response.user;
                        if (user != null) {
                          await supabase.from('users').insert({
                            'id': user.id,
                            'email': email,
                            'name': name,
                            'created_at': DateTime.now().toIso8601String(),
                          });

                          Get.to(() => VerificationCodeView(email: email));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Failed to sign up user"),
                            ),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Sign Up Error: $e")),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(height: 48),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                      children: [
                        TextSpan(text: 'By registering you agree to \n'),
                        TextSpan(
                          text: 'Terms & Conditions',
                          style: TextStyle(
                            color: Color(0xFF1565FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Color(0xFF1565FF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 142),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(SigninView());
                        },
                        child: const Text(
                          "Sign In",
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
        ),
      ),
    );
  }
}
