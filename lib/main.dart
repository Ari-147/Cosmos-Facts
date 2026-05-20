import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF070B1A),
    ),
  );
  runApp(const CosmoFactsApp());
}

class CosmoFactsApp extends StatelessWidget {
  const CosmoFactsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CosmoFacts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF070B1A),
        primaryColor: const Color(0xFF6B4CE6),
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6B4CE6),
          secondary: Color(0xFF4E9FFF),
          surface: Color(0xFF0F1529),
          background: Color(0xFF070B1A),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'System',
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF0F1529),
          selectedItemColor: Color(0xFF6B4CE6),
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'System',
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'System',
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.white70,
            fontFamily: 'System',
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.white60,
            fontFamily: 'System',
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}