import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/glassmorphism_card.dart';
import '../widgets/animated_stars.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

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
                  title: Text('About CosmoFacts'),
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  floating: true,
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // App logo section
                        _buildLogoSection(),
                        const SizedBox(height: 30),

                        // App description
                        GlassmorphismCard(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.auto_awesome_rounded, color: Color(0xFF6B4CE6), size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'About the App',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'CosmoFacts is a student project designed to share fascinating astronomy facts with space enthusiasts. '
                                    'Explore the wonders of our universe through daily facts, stunning imagery, and curated content about '
                                    'planets, stars, galaxies, black holes, and nebulae.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.8),
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Features section
                        GlassmorphismCard(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.star_rounded, color: Color(0xFF4E9FFF), size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'Features',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              _buildFeatureItem(Icons.wb_sunny_rounded, 'Daily Astronomy Facts'),
                              _buildFeatureItem(Icons.category_rounded, '5+ Space Categories'),
                              _buildFeatureItem(Icons.favorite_rounded, 'Save Favorite Facts'),
                              _buildFeatureItem(Icons.share_rounded, 'Share with Friends'),
                              _buildFeatureItem(Icons.image_rounded, 'Stunning Space Images'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Credits section
                        GlassmorphismCard(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.person_rounded, color: Color(0xFF6B4CE6), size: 24),
                                  SizedBox(width: 10),
                                  Text(
                                    'Credits',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              const Text(
                                'Created by: Muhammad Ali',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Flutter Development',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(height: 15),
                              const Divider(color: Colors.white24),
                              const SizedBox(height: 10),
                              Text(
                                'Images provided by Unsplash',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Inspirational quote
                        GlassmorphismCard(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.format_quote_rounded,
                                color: Color(0xFF6B4CE6),
                                size: 40,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '"The universe is a pretty big place. If it\'s just us, seems like an awful waste of space."',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white.withOpacity(0.9),
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '- Carl Sagan',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: const Color(0xFF6B4CE6),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
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

  Widget _buildLogoSection() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFF6B4CE6).withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
            child: const Icon(
              Icons.star_rounded,
              size: 80,
              color: Color(0xFF6B4CE6),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'CosmoFacts',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Explore the Universe',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.6),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF4E9FFF)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
          const Icon(Icons.check_circle_rounded, size: 18, color: Color(0xFF6B4CE6)),
        ],
      ),
    );
  }
}