import 'package:flutter/material.dart';
import '../models/fact.dart';
import '../data/fact_database.dart';
import '../widgets/glassmorphism_card.dart';
import '../widgets/category_card.dart';
import '../widgets/animated_stars.dart';
import 'fact_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/about_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Fact factOfTheDay;
  List<Fact> randomFacts = [];

  @override
  void initState() {
    super.initState();
    factOfTheDay = FactsDatabase.getFactOfTheDay();

    // Get 3 random facts for quick facts section
    final allFacts = FactsDatabase.getAllFacts();
    allFacts.shuffle();
    randomFacts = allFacts.take(3).toList();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Different screens for bottom navigation
    final List<Widget> screens = [
      _buildHomeContent(),
      const CategoriesScreen(),
      const FavoritesScreen(),
      const AboutScreen(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Animated stars background
          const AnimatedStars(),

          // Main content
          screens[_selectedIndex],
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6B4CE6).withOpacity(0.1),
              blurRadius: 20,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_rounded),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info_rounded),
              label: 'About',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeContent() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              _buildHeader(),
              const SizedBox(height: 30),

              // Fact of the Day
              _buildFactOfTheDay(),
              const SizedBox(height: 30),

              // Categories Section
              _buildCategoriesSection(),
              const SizedBox(height: 30),

              // Random Facts Section
              _buildQuickFactsSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 5),
        Text(
          'Amazing astronomy facts daily',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.white60,
          ),
        ),
      ],
    );
  }

  Widget _buildFactOfTheDay() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.wb_sunny_rounded,
              color: const Color(0xFF6B4CE6),
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'Fact of the Day',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FactDetailScreen(fact: factOfTheDay),
              ),
            );
          },
          child: GlassmorphismCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fact image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    factOfTheDay.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: const Color(0xFF0F1529),
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.white24,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 15),

                // Category badge
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6B4CE6), Color(0xFF4E9FFF)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    factOfTheDay.category,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Fact title
                Text(
                  factOfTheDay.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                // Short description
                Text(
                  factOfTheDay.shortDescription,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 15),

                // Read more button
                Row(
                  children: [
                    Text(
                      'Read more',
                      style: TextStyle(
                        color: const Color(0xFF6B4CE6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: const Color(0xFF6B4CE6),
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesSection() {
    final categories = FactsDatabase.getCategories();
    final icons = [
      Icons.public_rounded,
      Icons.star_rounded,
      Icons.blur_circular_rounded,
      Icons.circle_outlined,
      Icons.cloud_rounded,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Explore Categories',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index < categories.length - 1 ? 15 : 0,
                ),
                child: CategoryCard(
                  category: categories[index],
                  icon: icons[index],
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuickFactsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Facts',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        ...randomFacts.map((fact) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FactDetailScreen(fact: fact),
                  ),
                );
              },
              child: GlassmorphismCard(
                child: Row(
                  children: [
                    // Fact icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6B4CE6), Color(0xFF4E9FFF)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.auto_awesome_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 15),

                    // Fact details
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            fact.category,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Arrow icon
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white30,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}