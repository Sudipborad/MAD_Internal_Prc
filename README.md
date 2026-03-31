# TradeHub - Peer-to-Peer Marketplace App

## Overview
TradeHub is a Flutter-based Peer-to-Peer Marketplace application that enables users to buy and sell second-hand goods efficiently. The app features product listings with images, in-app chat, ratings & reviews, secure payments, and offline browsing capabilities.

## Project Structure

```
tradehub_marketplace/
├── lib/
│   ├── config/          # Theme and configuration
│   ├── models/          # Data models
│   ├── providers/       # State management
│   ├── screens/         # UI screens
│   ├── widgets/         # Reusable widgets
│   ├── services/        # API and database services
│   ├── main.dart        # Entry point
│   └── firebase_options.dart
├── assets/
│   ├── images/          # App images
│   ├── icons/           # App icons
│   └── fonts/           # Custom fonts
└── pubspec.yaml         # Dependencies
```

## Development Modules

### Module 1: Initialization ✅
- **Status**: COMPLETED
- **Features**:
  - Project setup with Flutter
  - Firebase configuration
  - Theme and color scheme
  - Models (User, Product)
  - Authentication provider
  - Splash screen
  - Auth screen (Sign In / Sign Up)
  - Home screen with product browsing

**Key Files**:
- `pubspec.yaml` - Dependencies
- `lib/main.dart` - App entry point
- `lib/config/theme.dart` - Theme configuration
- `lib/models/` - Data models
- `lib/providers/auth_provider.dart` - Authentication
- `lib/screens/splash_screen.dart` - Splash UI
- `lib/screens/auth_screen.dart` - Auth UI
- `lib/screens/home_screen.dart` - Home UI

**Commit**: Initialization → Project setup with Flutter, Firebase, and base screens

---

### Module 2: Listing Module ⏳
- **Status**: PENDING
- **Features**:
  - Add product listings
  - Edit/delete listings
  - Image upload to Firebase Storage
  - Product search and filtering
  - Product detail view
  - Offline caching

---

### Module 3: Chat System ⏳
- **Status**: PENDING
- **Features**:
  - Real-time chat between buyers and sellers
  - Chat history
  - Message notifications
  - Seller/buyer contacts list

---

### Module 4: Payment & UI Polish ⏳
- **Status**: PENDING
- **Features**:
  - Secure payment integration
  - Order tracking
  - Ratings and reviews system
  - User profiles
  - UI polish and animations

---

## Getting Started

### Prerequisites
- Flutter 3.0+
- Firebase project
- Dart 3.0+

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Sudipborad/MAD_Internal_Prc.git
   cd MAD_Internal_Prc
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Update `lib/firebase_options.dart` with your Firebase credentials
   - Add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)

4. **Run the app**
   ```bash
   flutter run
   ```

---

## Technologies Used

- **Framework**: Flutter
- **Backend**: Firebase (Auth, Firestore, Storage, Realtime Database)
- **State Management**: Provider, GetX
- **Local Storage**: Hive, SharedPreferences
- **UI**: Flutter Material Design 3
- **Networking**: HTTP, Dio

---

## Design Reference

The UI design is based on modern dark theme principles with:
- Custom color scheme (Orange accent #f5a623, Red #ff6b35)
- Responsive layouts
- Smooth animations
- Accessibility focus

---

## Commit History

| Commit | Module | Description |
|--------|--------|-------------|
| Initial | Initialization | Project setup with Flutter, Firebase, and base screens |
| WIP | Listing Module | Add product listings and filtering |
| WIP | Chat System | Real-time messaging system |
| WIP | Payment & UI | Payments, reviews, and UI polish |

---

## Contributors

- Development Team

---

## License

MIT License
