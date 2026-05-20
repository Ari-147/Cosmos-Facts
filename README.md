# 🌌 CosmoFacts - Astronomy Facts Mobile App

<div align="center">

![Flutter Version](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Dart Version](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green.svg)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

**Explore the wonders of the universe, one fact at a time!**

[Features](#✨-features) • [Installation](#🚀-installation) • [Tech Stack](#💻-tech-stack) • [Project Structure](#📁-project-structure)

</div>

---

## 📖 About The Project

**CosmoFacts** is a beautifully designed astronomy facts mobile application developed as a university student project. The app provides users with fascinating space facts, stunning astronomy imagery, and an immersive space-themed experience.

### Purpose
This project demonstrates proficiency in:
- Modern Flutter development
- Custom UI/UX design implementation
- State management patterns
- API integration concepts
- Mobile app architecture

### Key Highlights
- ✨ **28+ Astronomy Facts** across 5 categories
- 🎨 **Premium Space-themed UI** with glassmorphism design
- ⭐ **Daily Featured Fact** - New fact every day
- 💾 **Offline-ready** - Works without internet connection
- ❤️ **Favorites System** - Save and manage favorite facts
- 📤 **Share Facts** - Share interesting facts with friends

---

## ✨ Features

### Core Features
| Feature | Description |
|---------|-------------|
| **Daily Fact** | New astronomy fact featured every day |
| **Category Browsing** | Explore facts by Planets, Stars, Galaxies, Black Holes, Nebulae |
| **Favorites** | Save interesting facts to read later |
| **Share Facts** | Share facts via social media, messages, etc. |
| **Rich Media** | Stunning space images for each fact |

### UI/UX Features
- 🌟 **Animated Stars Background** - Twinkling stars effect
- 🔮 **Glassmorphism Cards** - Modern frosted glass design
- 🌈 **Gradient Accents** - Purple to blue gradients throughout
- 📱 **Responsive Layout** - Works on different screen sizes
- 🎭 **Smooth Animations** - Fade transitions and hover effects

---

<div align="center">

| Home Screen | Categories | Fact Detail | Favorites |
|-------------|------------|-------------|-----------|
| 🏠 Daily fact + Quick access | 📚 5 astronomy categories | 📖 Full fact + image share | ❤️ Saved facts collection |

</div>

---

## 🚀 Installation

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0 or higher)
- [Android Studio](https://developer.android.com/studio) / [VS Code](https://code.visualstudio.com/)
- Android device/emulator or iOS simulator

### Step-by-Step Setup

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/cosmofacts.git
cd cosmofacts
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

> **Note**: First run may take 2-5 minutes as Gradle downloads necessary dependencies.

### Building APK
```bash
# Debug APK
flutter build apk --debug

# Release APK (optimized)
flutter build apk --release
```

The APK will be generated at:
```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 💻 Tech Stack

### Frontend
- **Framework**: Flutter 3.0+
- **Language**: Dart 3.0+
- **State Management**: setState (lightweight, beginner-friendly)
- **Navigation**: MaterialPageRoute + BottomNavigationBar

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  share_plus: ^7.2.1    # Share facts functionality
  url_launcher: ^6.2.1   # Link handling
  cupertino_icons: ^1.0.6
```

### Architecture Pattern
```
MVC-inspired Structure:
├── Models (Data structures)
├── Screens (Views + Controllers)
├── Widgets (Reusable UI components)
└── Data (Local database)
```

---

## 📁 Project Structure

```
cosmofacts/
│
├── lib/
│   ├── main.dart                 # App entry point
│   ├── models/
│   │   └── fact.dart            # Fact data model
│   ├── data/
│   │   └── fact_database.dart   # Local facts database (28+ facts)
│   ├── screens/
│   │   ├── splash_screen.dart    # Animated launch screen
│   │   ├── home_screen.dart      # Main dashboard
│   │   ├── categories_screen.dart # Category browser
│   │   ├── fact_detail_screen.dart # Full fact view
│   │   ├── favorites_screen.dart  # Saved facts
│   │   └── about_screen.dart      # App info
│   └── widgets/
│       ├── animated_stars.dart    # Star background animation
│       ├── glassmorphism_card.dart # Frosted glass effect
│       └── category_card.dart     # Category grid item
│
├── android/                      # Android-specific files
├── assets/                       # App assets (icons, fonts)
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

---

## 🎨 Design System

### Colors
| Color Name | Hex Code | Usage |
|------------|----------|-------|
| Deep Space Navy | `#070B1A` | Main background |
| Surface Dark | `#0F1529` | Card backgrounds |
| Gradient Purple | `#6B4CE6` | Primary accents, buttons |
| Gradient Blue | `#4E9FFF` | Secondary accents |

### Typography
- **Primary Font**: System default (fallback to Poppins on supported devices)
- **Heading Sizes**: 32px, 24px, 20px
- **Body Sizes**: 16px, 14px

### Visual Effects
- Glassmorphism (frosted glass with blur)
- Linear gradients
- Box shadows with glow
- Circular icon containers
- Rounded corners (20px radius)

---

## 🗃️ Data Structure

### Fact Model
```dart
class Fact {
  final String id;              // Unique identifier
  final String title;           // Fact title
  final String category;        // Planets, Stars, etc.
  final String shortDescription; // Preview text
  final String fullDescription;  // Detailed content
  final String imageUrl;        // Associated image
  bool isFavorite;              // Favorite status
}
```

### Categories
| Category | Facts Count | Icons |
|----------|-------------|-------|
| Planets | 5 | 🪐 public_rounded |
| Stars | 5 | ⭐ star_rounded |
| Galaxies | 5 | 🌌 blur_circular_rounded |
| Black Holes | 5 | 🕳️ circle_outlined |
| Nebulae | 5 | ☁️ cloud_rounded |

---

## 🔧 Customization Guide

### Adding New Facts
1. Open `lib/data/fact_database.dart`
2. Add new fact to the `getAllFacts()` list:
```dart
Fact(
  id: '29',
  title: 'Your Fact Title',
  category: 'Planets', // Must match existing category
  shortDescription: 'Brief preview',
  fullDescription: 'Detailed content...',
  imageUrl: 'https://your-image-url.com/image.jpg',
)
```

### Changing App Icon
1. Prepare icon in sizes: 48, 72, 96, 144, 192px
2. Replace files in `android/app/src/main/res/mipmap-*` folders
3. Or use `flutter_launcher_icons` package

### Modifying Colors
Edit color hex values in:
- `main.dart` (ThemeData)
- Individual screen files (Color constants)

---

## 🐛 Troubleshooting

### Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| **Bottom overflow error** | Reduce content height or add `SizedBox(height: 80)` at sliver end |
| **Images not loading** | Replace Unsplash URLs or add errorBuilder fallback |
| **Favorites not persisting** | Add `shared_preferences` package |
| **Build fails** | Run `flutter clean` then `flutter pub get` |

### Development Tips
- Use **Hot Reload** (`r`) for quick UI updates
- Use **Hot Restart** (`R`) for full app refresh
- Check console output for runtime errors

---

## 📈 Future Improvements

- [ ] **NASA APOD Integration** - Real astronomy picture of the day
- [ ] **Search Functionality** - Search facts by keywords
- [ ] **Offline Mode** - Cache images and facts
- [ ] **Dark/Light Theme** - Toggle between themes
- [ ] **Push Notifications** - Daily fact reminders
- [ ] **Onboarding Screen** - First-time user tutorial

---

## 🙏 Acknowledgments

- **Unsplash** for stunning astronomy images
- **Flutter Team** for the amazing framework
- **NASA** for space exploration inspiration
- **Carl Sagan** for the inspirational quote

---

## 👨‍💻 Author
Me ofc 🙃
---

## 📄 License

This project is licensed under the MIT License - see below:

```
MIT License

Copyright (c) 2024 CosmoFacts

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files...
```

---

## 📞 Contact & Support

For questions or feedback:
- 📧 Email: [ali147ch@gmail.com]
- 🐛 Issues: [GitHub Issues page]

---

<div align="center">

**Made with ❤️ and Flutter**

*Keep looking up!* 🌠

</div>

---

## 📋 Appendix: Fact Database Preview

The app includes 28 carefully curated astronomy facts:

<details>
<summary>Click to see fact examples</summary>

**Planets**
- Jupiter's Great Red Spot
- Venus Rotates Backwards
- Mars' Olympus Mons
- Saturn Could Float in Water
- Mercury's Extreme Temperatures

**Stars**
- Neutron Stars Density
- Sun Loses Mass
- Betelgeuse Supernova
- Stellar Nurseries
- R136a1 Brightness

**Galaxies**
- Milky Way Cannibalism
- Andromeda Collision
- 2 Trillion Galaxies
- Oldest Galaxy GN-z11
- Spiral Galaxy Rotation

**Black Holes & Nebulae**
- Time Dilation Effects
- First Black Hole Image
- Sagittarius A*
- Hawking Radiation
- Pillars of Creation

</details>

---

**⭐ If you found this project helpful, give it a star on GitHub!**
