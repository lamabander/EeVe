import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sawwah_app/Custom_Widget_/CustomTextField.dart';
import 'package:sawwah_app/Custom_Widget_/Custom_button.dart';
import 'package:sawwah_app/views/detail_order_page.dart';

class BookingFormPage extends StatelessWidget {
  BookingFormPage({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Booking Form',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Full Name', style: TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            CustomTextField(
              hintText: 'Enter your full name',
              controller: nameController,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),

            const Text('Email Address', style: TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            CustomTextField(
              hintText: 'Enter your valid email address',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),

            const Text('Ticket Amount', style: TextStyle(color: Colors.white, fontSize: 14)),
            const SizedBox(height: 6),
            CustomTextField(
              hintText: 'Only numbers allowed',
              controller: amountController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Spacer(),

            CustomButton(
              text: 'Continue',
              onPressed: () {
                final ticketAmount = int.tryParse(amountController.text) ?? 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DetailOrderPage(ticketAmount: ticketAmount),
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
