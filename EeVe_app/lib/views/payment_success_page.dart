import 'package:flutter/material.dart';
import 'package:sawwah_app/custom_Widget_/Custom_button.dart';
import 'package:sawwah_app/views/home_view.dart';
import 'package:sawwah_app/views/search_page.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image2.png',
              height: 220,
            ),
            const SizedBox(height: 32),
            const Text(
              'Payment Completed!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your ticket has been confirmed. You can now enjoy the event and explore more!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), 
        child: CustomButton(
          text: 'Explore more events',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const HomeView()),
              
            );
          },
        ),
      ),
    );
  }
}

     