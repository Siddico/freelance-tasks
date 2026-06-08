# 🏆 Sport Zone - Premium E-commerce UI

![Flutter Version](https://img.shields.io/badge/Flutter-v3.x-02569B?logo=flutter)
![Dart Version](https://img.shields.io/badge/Dart-v3.x-0175C2?logo=dart)
![UI](https://img.shields.io/badge/UI-Glassmorphism-FF6B35)
![RTL Support](https://img.shields.io/badge/RTL-Arabic_First-success)

A highly polished, production-ready **Product Details Screen** for a premium sports e-commerce mobile application called **"Sport Zone"**. This project was built to demonstrate advanced UI/UX development skills in Flutter, featuring modern design trends, smooth animations, and a clean, modular architecture.

---

## ✨ Key Features

- **🇸🇦 RTL First (Arabic):** Natively built to support Right-To-Left layouts using `Directionality` wrappers.
- **🧊 Glassmorphism Design:** Modern translucent UI elements with soft shadows and BackdropFilter blurs.
- **🎨 Premium Brand Identity:** Professional color palette focusing on deep sports blue (`#1A365D`) and vibrant orange (`#FF6B35`).
- **📱 Responsive Layout:** Perfectly scales on all phone sizes utilizing `SafeArea` and `SingleChildScrollView` to prevent overflow errors.
- **🎭 Smooth Animations:** 
  - Scale animations on quantity selectors.
  - AnimatedSwitcher for total price calculations.
  - Hero image support & InteractiveViewer for image zoom.
  - Haptic feedback (vibrations) on user interactions.

## 🧩 Modular Architecture

The UI is broken down into small, highly reusable, and isolated custom widgets to keep the code perfectly clean:

```text
lib/
├── screens/
│   └── details_screen.dart           # Main assembled screen
├── widgets/
│   ├── custom_app_bar.dart           # Floating translucent app bar
│   ├── product_image_carousel.dart   # Interactive product gallery
│   ├── product_info_section.dart     # Titles, ratings, and price
│   ├── size_selector.dart            # Animated chips for sizes/flavors
│   ├── quantity_selector.dart        # +/- counter
│   ├── product_description.dart      # Expandable text & specs
│   ├── benefits_section.dart         # Glassmorphic trust cards
│   ├── reviews_section.dart          # Rating distribution bars
│   ├── related_products_section.dart # Horizontal cross-sell carousel
│   └── bottom_purchase_bar.dart      # Sticky animated checkout CTA
├── theme/
│   └── theme.dart                    # Material 3 Custom ThemeData
├── constants/
│   └── colors.dart                   # Global brand colors
└── models/
    └── product_model.dart            # Data architecture
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (v3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/sport-zone-ui.git
   cd sport-zone-ui
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 🛠️ Tech Stack & Best Practices

- **Framework:** Flutter
- **State Management:** Core Flutter (`setState`, `ValueNotifier`, `AnimationController`) - Keeping it lightweight.
- **Styling:** Custom `ThemeData` with Material 3 integration.
- **Code Quality:** 100% clean `flutter analyze` with strict typing and Null Safety.

---
*Built with ❤️ for a premium mobile shopping experience.*
