import 'package:flutter/material.dart';
import 'package:sawwah_app/Custom_Widget_/Custom_button.dart';
import 'package:sawwah_app/Ai_views/ai_assistant_view.dart';
import 'package:sawwah_app/Ai_views/Ai_onboarding_view.dart';

class AiGetStartedView extends StatelessWidget {
  const AiGetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // Robot background
            Positioned.fill(
              child: Image.asset(
                'assets/AI.png',
                fit: BoxFit.cover,
              ),
            ),

            // Content layered over robot
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 120), // space from top
                  const Text(
                    'Your Personal AI Event Assistant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Let EeVe understand your vibe, budget, interests — and recommend the best events just for you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: 'GET STARTED',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AiOnboardingView(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
