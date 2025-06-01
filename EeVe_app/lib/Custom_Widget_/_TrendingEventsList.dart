import 'package:flutter/material.dart';
import 'package:sawwah_app/views/event_detail.dart';

class TrendingEventsList extends StatelessWidget {
  const TrendingEventsList({super.key});

  @override
  Widget build(BuildContext context) {
    final events = [
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

    return SizedBox(
      height: 220,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: events.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final event = events[index];

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              splashColor: Colors.purple.withOpacity(0.1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        EventDetailsPage(title: event['title']!),
                  ),
                );
              },
              child: Container(
                width: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF01010C), Color(0xFF594C70)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E2C),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.asset(
                            event['image']!,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event['title']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                event['location']!,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                event['price']!,
                                style: const TextStyle(
                                  color: Color(0xFF339FFF),
                                  fontWeight: FontWeight.bold,
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
            ),
          );
        },
      ),
    );
  }
}


