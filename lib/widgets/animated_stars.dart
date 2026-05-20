import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimatedStars extends StatefulWidget {
  const AnimatedStars({Key? key}) : super(key: key);

  @override
  State<AnimatedStars> createState() => _AnimatedStarsState();
}

class _AnimatedStarsState extends State<AnimatedStars>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Star> _stars = [];

  @override
  void initState() {
    super.initState();

    final random = math.Random();
    for (int i = 0; i < 120; i++) {
      _stars.add(_Star(
        x: random.nextDouble(),
        y: random.nextDouble(),
        size: random.nextDouble() * 2.5 + 0.5,
        opacity: random.nextDouble() * 0.5 + 0.2,
        speed: random.nextDouble() * 2 + 0.5,
      ));
    }

    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _StarsPainter(_stars, _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class _Star {
  final double x;
  final double y;
  final double size;
  final double opacity;
  final double speed;

  _Star({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speed,
  });
}

class _StarsPainter extends CustomPainter {
  final List<_Star> stars;
  final double animationValue;

  _StarsPainter(this.stars, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var star in stars) {
      // Twinkling effect
      final twinkle = (math.sin(animationValue * math.pi * 2 * star.speed + star.x * 10) + 1) / 2;
      final opacity = star.opacity * (0.5 + twinkle * 0.5);

      final paint = Paint()
        ..color = Colors.white.withOpacity(opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(star.x * size.width, star.y * size.height),
        star.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_StarsPainter oldDelegate) => true;
}