# 🚀 Enterprise Flutter Application

**Production-Grade • Enterprise-Ready • Fortune 500 Compliant**

This is a fully-configured, production-ready Flutter application with enterprise-level CI/CD integration via Codemagic.

---

## 📋 Table of Contents

- [Features](#-features)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Codemagic Configuration](#-codemagic-configuration)
- [Environment Configuration](#-environment-configuration)
- [Deployment](#-deployment)

---

## ✨ Features

### Core Capabilities
- ✅ **State Management** - Riverpod for scalable state management
- ✅ **Routing** - GoRouter for declarative navigation
- ✅ **API Integration** - Dio + Retrofit for type-safe networking
- ✅ **Local Storage** - Hive + SharedPreferences
- ✅ **Environment Management** - Multi-environment support (dev/staging/prod)
- ✅ **Code Generation** - Freezed, JSON Serializable, Retrofit
- ✅ **Analytics & Crashlytics** - Firebase integration ready
- ✅ **Responsive Design** - Adaptive UI for all screen sizes
- ✅ **Theme Support** - Light/Dark mode with Material 3

### Enterprise Features
- 🔒 **Security** - Secure storage, certificate pinning ready
- 📊 **Monitoring** - Crash reporting and analytics
- 🧪 **Testing** - Unit, widget, and integration tests
- 📝 **Code Quality** - Strict linting rules and analysis
- 🔄 **CI/CD** - Fully automated Codemagic pipelines
- 🌐 **Multi-platform** - iOS, Android, and Web support
- 🎯 **Performance** - Optimized builds with code splitting

---

## 🏗️ Architecture

```
Clean Architecture + Feature-First Organization

lib/
├── main.dart                    # Application entry point
└── src/
    ├── core/                    # Core functionality
    │   ├── app.dart            # Main app widget
    │   ├── config/             # App configuration
    │   │   ├── environment_config.dart
    │   │   └── theme_config.dart
    │   └── routing/            # Navigation
    │       └── app_router.dart
    ├── features/               # Feature modules
    │   ├── home/
    │   │   └── presentation/
    │   │       └── pages/
    │   │           └── home_page.dart
    │   └── dashboard/
    │       └── presentation/
    │           └── pages/
    │               └── dashboard_page.dart
    └── shared/                 # Shared utilities
```

---

## 📁 Project Structure

```
flutter_app/
├── lib/                        # Application source code
├── android/                    # Android-specific code
├── ios/                        # iOS-specific code
├── web/                        # Web-specific code
├── test/                       # Unit and widget tests
├── .env*                       # Environment configurations
├── pubspec.yaml               # Dependencies
└── analysis_options.yaml      # Linting rules
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.2.0 or higher)
- Dart SDK (3.0.0 or higher)
- IDE (VS Code, Android Studio, or IntelliJ)

### Installation

1. **Clone the repository**
   ```bash
   cd flutter_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation (if needed)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # Development
   flutter run --dart-define=ENVIRONMENT=development
   
   # Staging
   flutter run --dart-define=ENVIRONMENT=staging
   
   # Production
   flutter run --dart-define=ENVIRONMENT=production
   ```

### Build Commands

```bash
# Web
flutter build web --release --web-renderer canvaskit

# Android
flutter build apk --release --split-per-abi
flutter build appbundle --release

# iOS
flutter build ipa --release
```

---

## 🔧 Codemagic Configuration

The `codemagic.yaml` file in the root directory configures 5 enterprise-grade workflows:

### 1. 🌐 Web Preview (`web-preview`)
- **Trigger**: Push to `main`, `develop`, or `feature/*` branches
- **Output**: Production-optimized web build
- **Features**:
  - Code analysis and testing
  - Bundle size analysis
  - CanvasKit renderer for better performance
  - PWA support with offline-first strategy

### 2. 📱 iOS Production (`ios-production`)
- **Trigger**: Git tags matching `v*.*.*` (e.g., v1.0.0)
- **Output**: Signed IPA for App Store
- **Features**:
  - Automatic code signing
  - TestFlight deployment
  - App size analysis

### 3. 🤖 Android Production (`android-production`)
- **Trigger**: Git tags matching `v*.*.*`
- **Output**: Signed AAB and APK files
- **Features**:
  - Automatic keystore management
  - Play Store deployment
  - Multi-architecture APK builds

### 4. 🔄 Web Staging (`web-staging`)
- **Trigger**: Push to `develop` or `staging` branches
- **Output**: Staging web build for QA

### 5. 🧪 PR Checks (`pr-check`)
- **Trigger**: Pull requests to any branch
- **Output**: Quick validation
- **Features**:
  - Format checking
  - Code analysis
  - Unit tests
  - Debug build verification

### Critical Configuration

The most important part of the configuration is:

```yaml
environment:
  project_path: flutter_app  # ← Points to your Flutter project folder
```

This ensures Codemagic builds your real app, not the default counter demo.

---

## 🔐 Environment Configuration

### Environment Files

- `.env.dev` - Development environment
- `.env.staging` - Staging environment
- `.env.prod` - Production environment

### Environment Variables

```bash
API_BASE_URL=https://api.example.com
API_KEY=your_api_key_here
FIREBASE_API_KEY=your_firebase_key_here
ENVIRONMENT=production
```

### Codemagic Secrets

Configure these in Codemagic dashboard under **Environment variables**:

**Production Secrets Group**
- `API_KEY`
- `FIREBASE_API_KEY`
- Any other sensitive keys

**iOS Credentials Group**
- App Store Connect API key
- Certificate and provisioning profiles

**Android Credentials Group**
- `ANDROID_KEYSTORE_FILE` (base64 encoded)
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`
- `GCLOUD_SERVICE_ACCOUNT_CREDENTIALS`

---

## 📦 Deployment

### Web Deployment

After a successful Codemagic build:

1. Download the `build/web` artifact
2. Deploy to your hosting service:
   - **Firebase Hosting**: `firebase deploy`
   - **Vercel**: `vercel --prod`
   - **Netlify**: Drag & drop or CLI
   - **AWS S3**: `aws s3 sync build/web s3://your-bucket`

### iOS Deployment

- Automatic TestFlight deployment configured
- Manual App Store submission via App Store Connect

### Android Deployment

- Automatic internal track deployment configured
- Promote to beta/production via Google Play Console

---

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test
```

---

## 📊 Code Quality

```bash
# Analyze code
flutter analyze

# Format code
flutter format .

# Check format
flutter format --set-exit-if-changed .
```

---

## 🔗 Useful Links

- [Flutter Documentation](https://flutter.dev/docs)
- [Codemagic Documentation](https://docs.codemagic.io/)
- [Riverpod Documentation](https://riverpod.dev/)
- [GoRouter Documentation](https://pub.dev/packages/go_router)

---

## 📝 License

Copyright © 2024 Enterprise Inc. All rights reserved.

---

## 🤝 Support

For support, email engineering@example.com or contact your DevOps team.

---

**Built with ❤️ for Fortune 500 Excellence**
