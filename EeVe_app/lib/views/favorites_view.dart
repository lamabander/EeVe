import 'package:flutter/material.dart';
import 'package:sawwah_app/custom_Widget_/event_card_small.dart';
import 'package:sawwah_app/views/event_detail.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key,});



  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Favorites', style: TextStyle(color: Colors.white)),
      ),
      body: ValueListenableBuilder<List<Event>>(
        valueListenable: FavoriteManager.favoritesNotifier,
        builder: (context, favorites, _) {
          if (favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: favorites.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final event = favorites[index];
              return InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EventDetail(
                        title: event.title,
                        image: event.image,
                        location: event.location,
                        price: event.price,
                      ),
                    ),
                  );
                },
                child: CompactEventCard(
                  title: event.title,
                  location: event.location,
                  imageAsset: event.image,
                  price: double.tryParse(event.price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0, // مشكلة 🔴
                ),
              );
            },
          );
        },
      ),
    );
  }
}

