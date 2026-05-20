import 'package:flutter/material.dart';
import '../data/fact_database.dart';
import '../models/fact.dart';
import '../widgets/glassmorphism_card.dart';
import '../widgets/animated_stars.dart';
import '../fact_detail_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = FactsDatabase.getCategories();
    final icons = {
      'Planets': Icons.public_rounded,
      'Stars': Icons.star_rounded,
      'Galaxies': Icons.blur_circular_rounded,
      'Black Holes': Icons.circle_outlined,
      'Nebulae': Icons.cloud_rounded,
    };
    final descriptions = {
      'Planets': 'Explore our solar system\'s fascinating worlds',
      'Stars': 'Discover the life and death of stars',
      'Galaxies': 'Journey through cosmic islands of stars',
      'Black Holes': 'Learn about the universe\'s mysterious objects',
      'Nebulae': 'Witness stunning stellar nurseries',
    };

    return Scaffold(
      body: Stack(
        children: [
          const AnimatedStars(),
          SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // App bar
                const SliverAppBar(
                  title: Text('Explore Categories'),
                  centerTitle: true,
                  floating: true,
                  backgroundColor: Colors.transparent,
                ),

                // Categories grid - FIXED: Added bottom padding to prevent overflow
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      // FIXED: Increased child aspect ratio to make cards less tall
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        final category = categories[index];
                        return _buildCategoryCard(
                          context,
                          category,
                          icons[category] ?? Icons.category_rounded,
                          descriptions[category] ?? '',
                        );
                      },
                      childCount: categories.length,
                    ),
                  ),
                ),

                // FIXED: Added extra bottom spacing to prevent overflow
                const SliverToBoxAdapter(
                  child: SizedBox(height: 80),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category, IconData icon, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryFactsScreen(category: category),
          ),
        );
      },
      child: GlassmorphismCard(
        // FIXED: Reduced padding and made card more compact
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FIXED: Smaller icon container to reduce height
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6B4CE6), Color(0xFF4E9FFF)],
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6B4CE6).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(icon, size: 35, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              category,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white60,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            // Fact count badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFF6B4CE6).withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${FactsDatabase.getFactsByCategory(category).length} facts',
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF6B4CE6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Screen showing facts for a specific category
class CategoryFactsScreen extends StatelessWidget {
  final String category;

  const CategoryFactsScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facts = FactsDatabase.getFactsByCategory(category);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          const AnimatedStars(),
          facts.isEmpty
              ? const Center(
            child: Text(
              'No facts available',
              style: TextStyle(color: Colors.white54),
            ),
          )
              : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: facts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _buildFactCard(context, facts[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFactCard(BuildContext context, Fact fact) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FactDetailScreen(fact: fact),
          ),
        );
      },
      child: GlassmorphismCard(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fact image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              child: Image.network(
                fact.imageUrl,
                height: 140, // Reduced from 160 to save space
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 140,
                    color: const Color(0xFF0F1529),
                    child: Center(
                      child: Icon(Icons.image_not_supported, color: Colors.white24, size: 40),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6B4CE6), Color(0xFF4E9FFF)],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      fact.category,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    fact.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    fact.shortDescription,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white70,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        'Read more',
                        style: TextStyle(
                          color: const Color(0xFF6B4CE6),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, color: const Color(0xFF6B4CE6), size: 14),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}