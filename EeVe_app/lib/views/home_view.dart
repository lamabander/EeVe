import 'package:flutter/material.dart';
import 'package:sawwah_app/Custom_Widget_/_PromoCard.dart';
import 'package:sawwah_app/Custom_Widget_/home_header_widget.dart';
import 'package:sawwah_app/Custom_Widget_/CategoryList.dart';
import 'package:sawwah_app/Custom_Widget_/_TrendingEventsList.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              const SizedBox(height: 24),
              PromoCard(),
              const SizedBox(height: 32),
              const Text(
                "Trending Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16), // was 12
              CategoryList(),
              const SizedBox(height: 40), // was 28
              const Text(
                "Trending in Riyadh",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16), // was 12
              TrendingEventsList(),
            ],
          ),
        ),
      ),
    );
  }
}

