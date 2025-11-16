# 🌊 Flowline

A real-time wait-time tracker and crowd-flow visualizer built with Flutter + Firebase.

## Features

- 🗺️ **Interactive Map View**: Visualize locations and crowd density on an interactive map
- ⏱️ **Real-Time Wait Times**: Track and display wait times at various locations
- 📊 **Crowd Flow Analytics**: Monitor crowd levels (low, moderate, high)
- 📍 **Location Services**: Find nearby locations and get directions
- 🔥 **Firebase Integration**: Real-time data synchronization with Cloud Firestore
- 📱 **Cross-Platform**: Runs on iOS and Android

## Tech Stack

- **Framework**: Flutter 3.0+
- **Backend**: Firebase (Firestore, Auth, Analytics)
- **Maps**: flutter_map with OpenStreetMap tiles
- **Location**: Geolocator & Geocoding
- **State Management**: Provider
- **UI**: Material Design 3

## Getting Started

### Prerequisites

- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- Firebase project setup
- iOS Simulator / Android Emulator or physical device

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd flowline
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Set up Firebase:
   - Create a new Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Add iOS and Android apps to your Firebase project
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Place them in the appropriate directories:
     - Android: `android/app/google-services.json`
     - iOS: `ios/Runner/GoogleService-Info.plist`
   - Run `flutterfire configure` to generate `firebase_options.dart`

4. Add font files (optional):
   - Download Inter font from [Google Fonts](https://fonts.google.com/specimen/Inter)
   - Place `Inter-Regular.ttf` and `Inter-Bold.ttf` in `assets/fonts/`

5. Configure location permissions:

   **iOS** (`ios/Runner/Info.plist`):
   ```xml
   <key>NSLocationWhenInUseUsageDescription</key>
   <string>This app needs access to location for showing nearby places.</string>
   <key>NSLocationAlwaysUsageDescription</key>
   <string>This app needs access to location for showing nearby places.</string>
   ```

   **Android** (`android/app/src/main/AndroidManifest.xml`):
   ```xml
   <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
   <uses-permission android:name="android.permission.INTERNET"/>
   ```

### Running the App

```bash
flutter run
```

For specific platforms:
```bash
flutter run -d ios        # iOS
flutter run -d android    # Android
```

## Project Structure

```
flowline/
├── lib/
│   ├── main.dart              # App entry point
│   ├── models/                # Data models
│   │   └── location_model.dart
│   ├── screens/               # UI screens
│   │   ├── home_screen.dart
│   │   ├── map_screen.dart
│   │   └── wait_time_screen.dart
│   ├── services/              # Business logic & API
│   │   └── firebase_service.dart
│   └── widgets/               # Reusable components
│       ├── custom_button.dart
│       └── loading_indicator.dart
├── assets/                    # Static assets
│   ├── fonts/
│   ├── icons/
│   └── images/
├── android/                   # Android-specific code
├── ios/                       # iOS-specific code
└── pubspec.yaml              # Dependencies
```

## Firebase Firestore Structure

```
locations/
  └── {locationId}
      ├── name: string
      ├── address: string
      ├── latitude: number
      ├── longitude: number
      ├── waitTime: number (minutes)
      ├── crowdLevel: string ('low', 'moderate', 'high')
      ├── category: string (optional)
      ├── lastUpdated: timestamp
      └── metadata: map (optional)
```

## Features Roadmap

- [ ] User authentication (Email/Google/Apple)
- [ ] Real-time notifications for wait time changes
- [ ] Historical data and trends
- [ ] User-submitted wait time updates
- [ ] Favorite locations
- [ ] Search and filter functionality
- [ ] Heat map visualization
- [ ] Payment integration with Stripe (for premium features)
- [ ] Dark mode support (already implemented)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

For issues, questions, or contributions, please open an issue on GitHub.

---

Built with ❤️ using Flutter and Firebase
