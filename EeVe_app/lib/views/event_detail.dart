import 'package:sawwah_app/custom_Widget_/Custom_button.dart';
import 'package:sawwah_app/custom_Widget_/_TrendingEventsList.dart';
import 'package:sawwah_app/custom_Widget_/image_ticket_card.dart';
import 'package:sawwah_app/views/search_page.dart';
import 'package:sawwah_app/views/booking_form_page.dart';
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String image;
  final String location;
  final String price;

  Event({
    required this.title,
    required this.image,
    required this.location,
    required this.price,
  });

  @override
  bool operator ==(Object other) {
    return other is Event && other.title == title && other.location == location;
  }

  @override
  int get hashCode => title.hashCode ^ location.hashCode;
}

class FavoriteManager {
  static final List<Event> _favorites = [];
  static final ValueNotifier<List<Event>> favoritesNotifier = ValueNotifier([]);

  static List<Event> get favorites => _favorites;

  static void toggleFavorite(Event event) {
    if (_favorites.contains(event)) {
      _favorites.remove(event);
    } else {
      _favorites.add(event);
    }
    favoritesNotifier.value = List.from(_favorites);
  }

  static bool isFavorite(Event event) {
    return _favorites.contains(event);
  }
}

class EventDetail extends StatefulWidget {
  final String title;
  final String image;
  final String location;
  final String price;

  const EventDetail({
    super.key,
    required this.title,
    required this.image,
    required this.location,
    required this.price,
  });

  @override
  State<EventDetail> createState() => _EventDetailState();
}

class _EventDetailState extends State<EventDetail> {
  late Event currentEvent;
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    currentEvent = Event(
      title: widget.title,
      image: widget.image,
      location: widget.location,
      price: widget.price,
    );
    isFavorite = FavoriteManager.isFavorite(currentEvent);
  }

  @override
  Widget build(BuildContext context) {
    final moreEvents = [
      {
        'image': 'assets/image1.png',
        'title': 'Dreamscape: Surreal Worlds',
        'location': 'House of Hype, Riyadh',
        'price': '99.00 SR',
      },
      {
        'image': 'assets/image1.png',
        'title': 'Midnight Grooves: A Night at Beast House',
        'location': 'Riyadh',
        'price': '149.00 SR',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Event Details',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                FavoriteManager.toggleFavorite(currentEvent);
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: Colors.white,
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.grey, size: 16),
                const SizedBox(width: 6),
                Text(
                  widget.location,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ImageTicketCard(imageAsset: widget.image),
            const SizedBox(height: 24),
            const Text(
              'About this event',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Dive into a journey of transformation through clay. Hosted by the Saudi Arabia Museum of Contemporary Art @JAX, this exhibit showcases innovative ceramic art reflecting themes of resilience and change. Explore modern interpretations, cultural heritage, and the evolving role of ceramics in contemporary design.',
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.4),
            ),
            const SizedBox(height: 24),
            const Text(
              'More events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            TrendingEventsList(events: moreEvents),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: CustomButton(
          text: 'Buy Ticket',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => BookingFormPage()),
            );
          },
        ),
      ),
    );
  }
}
