import 'package:flutter/material.dart';
import 'package:sawwah_app/custom_Widget_/event_card_small.dart';
import 'package:sawwah_app/views/event_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> allEvents = [
    {
      'title': 'Dreamscape: Surreal Worlds',
      'location': 'House of Hype, Riyadh',
      'image': 'assets/image1.png',
      'price': 99.00,
    },
    {
      'title': 'Ferdi Riyadh',
      'location': 'Via Riyadh',
      'image': 'assets/image1.png',
      'price': 50.00,
    },
    {
      'title': 'Slava\'s Snow Show',
      'location': 'Riyadh Arena',
      'image': 'assets/image1.png',
      'price': 100.00,
    },
  ];

  List<Map<String, dynamic>> filteredEvents = [];

  @override
  void initState() {
    super.initState();
    filteredEvents = allEvents;
    _searchController.addListener(_filterEvents);
  }

  void _filterEvents() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredEvents =
          allEvents.where((event) {
            final title = event['title'].toString().toLowerCase();
            final location = event['location'].toString().toLowerCase();
            return title.contains(query) || location.contains(query);
          }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Search Events',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for events...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1C1C1E),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredEvents.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final event = filteredEvents[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => EventDetail(
                              title: event['title'],
                              location: event['location'],
                              image: event['image'],
                              price: '${event['price']} SR',
                            ),
                      ),
                    );
                  },

                  child: CompactEventCard(
                    title: event['title'],
                    location: event['location'],
                    imageAsset: event['image'],
                    price: event['price'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
