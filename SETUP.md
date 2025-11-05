# Flowline Setup Guide

This guide will help you set up the Flowline app from scratch.

## Prerequisites

1. **Flutter SDK**: Install Flutter 3.0 or higher
   - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
   - Verify installation: `flutter doctor`

2. **Firebase Account**: Create a free account at [firebase.google.com](https://firebase.google.com)

3. **IDE**: VS Code or Android Studio with Flutter extensions

## Step 1: Flutter Setup

```bash
# Check Flutter installation
flutter doctor

# Get dependencies
flutter pub get

# Verify everything works
flutter run
```

## Step 2: Firebase Setup

### 2.1 Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Click "Add project"
3. Enter project name: "Flowline" (or your preferred name)
4. Disable Google Analytics (optional)
5. Click "Create project"

### 2.2 Enable Required Services

In your Firebase project:

1. **Authentication**
   - Go to Authentication → Sign-in method
   - Enable "Anonymous" authentication
   - (Optional) Enable Email/Password, Google, etc.

2. **Firestore Database**
   - Go to Firestore Database → Create database
   - Start in **test mode** (for development)
   - Choose a location close to your users
   - Create the following collection structure:
     ```
     locations (collection)
       └── (auto-generated document IDs)
           ├── name: string
           ├── address: string
           ├── latitude: number
           ├── longitude: number
           ├── waitTime: number
           ├── crowdLevel: string
           ├── category: string
           └── lastUpdated: timestamp
     ```

3. **Analytics** (Optional)
   - Automatically enabled with Firebase

### 2.3 Register Your Apps

#### For Android:

1. In Firebase Console, click "Add app" → Android icon
2. Enter Android package name: `com.example.flowline`
3. (Optional) Add app nickname: "Flowline Android"
4. Download `google-services.json`
5. Place it in `android/app/google-services.json`

#### For iOS:

1. In Firebase Console, click "Add app" → iOS icon
2. Enter iOS bundle ID: `com.example.flowline`
3. (Optional) Add app nickname: "Flowline iOS"
4. Download `GoogleService-Info.plist`
5. Place it in `ios/Runner/GoogleService-Info.plist`

### 2.4 FlutterFire CLI Setup

Install and configure FlutterFire CLI:

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase for Flutter
flutterfire configure
```

This will:
- Auto-detect your Firebase projects
- Generate `lib/firebase_options.dart`
- Configure both Android and iOS

## Step 3: Platform-Specific Configuration

### Android Configuration

The following files are already configured:
- ✅ `android/build.gradle`
- ✅ `android/app/build.gradle`
- ✅ `android/app/src/main/AndroidManifest.xml`

Just make sure `google-services.json` is in place!

### iOS Configuration

The following files are already configured:
- ✅ `ios/Runner/Info.plist`

Just make sure `GoogleService-Info.plist` is in place!

## Step 4: Add Assets (Optional)

### Fonts

1. Download Inter font from [Google Fonts](https://fonts.google.com/specimen/Inter)
2. Extract and copy to `assets/fonts/`:
   - `Inter-Regular.ttf`
   - `Inter-Bold.ttf`

### Icons & Images

- Add app icons to `assets/icons/`
- Add images to `assets/images/`

## Step 5: API Keys (Optional)

### Stripe Integration

If you want to enable payment features:

1. Create account at [stripe.com](https://stripe.com)
2. Get your API keys from Dashboard
3. Add to your environment/config

### Map Tiles

The app uses OpenStreetMap (free, no API key needed). For custom tiles:
- Consider Mapbox, Google Maps, or other providers
- Update `lib/screens/map_screen.dart` with your tile URL

## Step 6: Run the App

```bash
# For Android
flutter run -d android

# For iOS
flutter run -d ios

# For web (if enabled)
flutter run -d chrome
```

## Step 7: Test Firebase Connection

1. Launch the app
2. The app should automatically connect to Firebase
3. Try adding a location (you'll need to implement the UI for this)
4. Check Firestore Console to verify data is being written

## Troubleshooting

### Common Issues

1. **"google-services.json not found"**
   - Ensure the file is in `android/app/` directory
   - Run `flutter clean` and `flutter pub get`

2. **"Firebase not initialized"**
   - Make sure `flutterfire configure` was run successfully
   - Check that `firebase_options.dart` exists in `lib/`

3. **Location permissions not working**
   - Android: Check `AndroidManifest.xml` has location permissions
   - iOS: Check `Info.plist` has location usage descriptions

4. **Build errors**
   - Run `flutter clean`
   - Run `flutter pub get`
   - Try `flutter pub upgrade`

### Firebase Rules for Development

For development, use these Firestore rules (⚠️ NOT for production):

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write: if true;
    }
  }
}
```

For production, implement proper security rules:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /locations/{locationId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
  }
}
```

## Next Steps

1. Add sample data to Firestore
2. Customize the UI colors and branding
3. Implement user authentication flow
4. Add more features from the roadmap
5. Test on real devices
6. Set up CI/CD for deployment

## Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [FlutterFire Documentation](https://firebase.flutter.dev)
- [Firebase Console](https://console.firebase.google.com)
- [flutter_map Documentation](https://docs.fleaflet.dev)

## Need Help?

- Check the [main README](README.md) for general information
- Open an issue on GitHub
- Check Flutter and Firebase documentation

---

Happy coding! 🚀
