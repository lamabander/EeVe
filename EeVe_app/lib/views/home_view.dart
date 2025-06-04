import 'package:flutter/material.dart';
import 'package:sawwah_app/Custom_Widget_/_PromoCard.dart';
import 'package:sawwah_app/Custom_Widget_/home_header_widget.dart';
import 'package:sawwah_app/Custom_Widget_/CategoryList.dart';
import 'package:sawwah_app/custom_Widget_/_TrendingEventsList.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // الداتا الجديده — تقدر تجيبها من Supabase/API بعدين
    final myEventsList = [
      {
        'image': 'assets/event2.png',
        'title': "Slava’s Snowshow: A Magical Winter Spectacle",
        'location': 'Boulevard Riyadh City',
        'price': '120.00 SR'
      },
      {
        'image': 'assets/event2.png',
        'title': "Adaptability: Content & Ceramics Exhibition",
        'location': 'SAMoCA, JAX District',
        'price': 'Free'
      },
      {
        'image': 'assets/event2.png',
        'title': "Riyadh Season Fireworks Show",
        'location': 'Blvd City - Main Stage',
        'price': 'Free Entry'
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              HomeHeader(),
              const SizedBox(height: 24),

              // PromoCard
              PromoCard(),
              const SizedBox(height: 32),

              // Trending Categories
              const Text(
                "Trending Categories",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              CategoryList(),
              const SizedBox(height: 40),

              // Trending in Riyadh
              const Text(
                "Trending in Riyadh",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),

              // TrendingEventsList — تم التعديل ليأخذ داتا
              TrendingEventsList(events: myEventsList),
            ],
          ),
        ),
      ),
    );
  }
}
