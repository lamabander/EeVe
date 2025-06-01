import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': 'assets/concert.png', 'label': 'Music'},
      {'icon': "assets/room-service.png", 'label': 'Food & Drink'},
      {'icon': "assets/game-controller.png", 'label': 'Hobbies'},
      {'icon': "assets/ticket.png", 'label': "Visual Arts"},
      {'icon': 'assets/puzzle.png', 'label': 'Workshops'},
    ];

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = categories[index];
          return Column(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F0F10), Color(0xFF8B57E6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                  ),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1E1E2C),
                    ),
                    child: Center(
                      child: Image.asset(
                        item['icon']!,
                        height: 28,
                        width: 28,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['label']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
