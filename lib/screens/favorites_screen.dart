import 'package:flutter/material.dart';
import '../models/fact.dart';
import '../data/fact_database.dart';
import '../widgets/glassmorphism_card.dart';
import '../widgets/animated_stars.dart';
import '../fact_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Fact> favoriteFacts = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadFavorites();
  }

  void _loadFavorites() {
    final allFacts = FactsDatabase.getAllFacts();
    setState(() {
      favoriteFacts = allFacts.where((fact) => fact.isFavorite).toList();
    });
  }

  void _removeFavorite(Fact fact) {
    setState(() {
      fact.isFavorite = false;
      favoriteFacts.remove(fact);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Removed from favorites'),
        backgroundColor: Color(0xFF6B4CE6),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AnimatedStars(),
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverAppBar(
                  title: Text('My Favorites'),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  floating: true,
                ),

                if (favoriteFacts.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_border_rounded,
                            size: 80,
                            color: Colors.white.withOpacity(0.3),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'No favorites yet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Tap the ♡ icon on any fact to save it here',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.4),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          final fact = favoriteFacts[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _buildFavoriteCard(fact),
                          );
                        },
                        childCount: favoriteFacts.length,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFavoriteCard(Fact fact) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FactDetailScreen(fact: fact),
          ),
        );
        _loadFavorites(); // Refresh after returning
      },
      child: GlassmorphismCard(
        child: Row(
          children: [
            // Mini image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                fact.imageUrl,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 70,
                    height: 70,
                    color: const Color(0xFF0F1529),
                    child: const Icon(Icons.image_not_supported, size: 30, color: Colors.white24),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Fact info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fact.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    fact.category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B4CE6),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    fact.shortDescription,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white60,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Remove button
            IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.white54, size: 20),
              onPressed: () => _removeFavorite(fact),
            ),
          ],
        ),
      ),
    );
  }
}