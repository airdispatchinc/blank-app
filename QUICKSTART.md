# 🚀 Quick Start Guide

Get Flowline running in 5 minutes!

## Prerequisites

- Flutter 3.0+ installed
- Firebase account (free tier works)

## Setup Steps

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Firebase Setup (Choose One)

#### Option A: FlutterFire CLI (Recommended)
```bash
# Install CLI
dart pub global activate flutterfire_cli

# Configure (follow prompts)
flutterfire configure
```

#### Option B: Manual Setup
1. Create Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
2. Download `google-services.json` → place in `android/app/`
3. Download `GoogleService-Info.plist` → place in `ios/Runner/`
4. Enable Anonymous Auth in Firebase Console
5. Create Firestore database (test mode)

### 3. Run the App

```bash
# Android
flutter run -d android

# iOS  
flutter run -d ios
```

## Optional: Add Sample Data

In Firebase Console → Firestore, create a document in the `locations` collection:

```json
{
  "name": "Coffee Shop",
  "address": "123 Main St",
  "latitude": 37.7749,
  "longitude": -122.4194,
  "waitTime": 10,
  "crowdLevel": "moderate",
  "category": "cafe",
  "lastUpdated": [Firestore Timestamp]
}
```

## Troubleshooting

**Build fails?**
```bash
flutter clean
flutter pub get
```

**Firebase errors?**
- Ensure `google-services.json` (Android) or `GoogleService-Info.plist` (iOS) is in place
- Run `flutterfire configure` again

**Location not working?**
- Grant location permissions when prompted
- Check device location services are enabled

## Next Steps

- ✅ Check out [SETUP.md](SETUP.md) for detailed configuration
- ✅ Read [README.md](README.md) for features overview
- ✅ See [CONTRIBUTING.md](CONTRIBUTING.md) to contribute

---

Need help? Open an issue on GitHub!
