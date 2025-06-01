import 'package:flutter/material.dart';

class CompactEventCard extends StatelessWidget {
  final String title;
  final String location;
  final String imageAsset;
  final double price;

  const CompactEventCard({
    Key? key,
    required this.title,
    required this.location,
    required this.imageAsset,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageAsset,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '${price.toStringAsFixed(2)} SR',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF339FFF),
            ),
          )
        ],
      ),
    );
  }
}

// Example usage in a page
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Favorites', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          CompactEventCard(
            title: 'Dreamscape: Surreal Worlds and Experiences',
            location: 'House of Hype, Riyadh',
            imageAsset: 'assets/images/dreamscape.jpg',
            price: 99.00,
          ),
          CompactEventCard(
            title: 'Ferdi Riyadh: Paris Taste in the Heart of Via Riyadh',
            location: 'Via Riyadh',
            imageAsset: 'assets/images/ferdi.jpg',
            price: 50.00,
          ),
          CompactEventCard(
            title: "Slava's Show – Riyadh Edition",
            location: 'Riyadh',
            imageAsset: 'assets/images/slava.jpg',
            price: 100.00,
          ),
        ],
      ),
    );
  }
}
