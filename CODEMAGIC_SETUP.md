# 🔧 Codemagic Setup Guide

This guide will help you configure Codemagic to build your real Flutter app (not the counter demo).

---

## 🎯 Problem Solved

**Before**: Codemagic was building the default Flutter counter demo.  
**After**: Codemagic now builds your actual enterprise application from the `flutter_app` folder.

---

## ✅ What Was Fixed

### 1. **Project Path Configuration**

The critical fix in `codemagic.yaml`:

```yaml
environment:
  project_path: flutter_app  # ← This tells Codemagic where your real app is!
```

Without this, Codemagic would look for `pubspec.yaml` in the repository root and not find your Flutter project.

### 2. **Complete CI/CD Workflows**

Created 5 production-ready workflows:
- ✅ **web-preview** - Main web build (triggers on push to main/develop)
- ✅ **ios-production** - iOS App Store builds (triggers on version tags)
- ✅ **android-production** - Android Play Store builds (triggers on version tags)
- ✅ **web-staging** - Staging builds for QA
- ✅ **pr-check** - Pull request validation

---

## 🚀 Quick Start

### Step 1: Add Repository to Codemagic

1. Go to [codemagic.io](https://codemagic.io)
2. Click **Add application**
3. Connect your Git repository
4. Select **Use codemagic.yaml**
5. Codemagic will automatically detect the `codemagic.yaml` file

### Step 2: Configure Environment Variables

In Codemagic dashboard, create these **Environment variable groups**:

#### **production_secrets** (for all production builds)
```
API_KEY = your_production_api_key
FIREBASE_API_KEY = your_firebase_key
```

#### **staging_secrets** (for staging builds)
```
API_KEY = your_staging_api_key
FIREBASE_API_KEY = your_firebase_staging_key
```

#### **app_store_credentials** (for iOS builds)
- App Store Connect API Key
- Use Codemagic's automatic code signing

#### **google_play_credentials** (for Android builds)
```
ANDROID_KEYSTORE_FILE = <base64 encoded keystore>
ANDROID_KEYSTORE_PASSWORD = your_keystore_password
ANDROID_KEY_ALIAS = your_key_alias
ANDROID_KEY_PASSWORD = your_key_password
GCLOUD_SERVICE_ACCOUNT_CREDENTIALS = <Google Play service account JSON>
```

### Step 3: Configure Code Signing

#### iOS
1. In Codemagic, go to **Code signing identities**
2. Click **iOS code signing**
3. Follow the wizard to connect App Store Connect
4. Enable automatic code signing

#### Android
1. Generate a keystore:
   ```bash
   keytool -genkey -v -keystore release.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release
   ```
2. Base64 encode it:
   ```bash
   base64 release.jks > keystore_base64.txt
   ```
3. Add the base64 string to `ANDROID_KEYSTORE_FILE` environment variable

### Step 4: Test the Build

#### Option A: Trigger Web Build
```bash
git add .
git commit -m "Configure Codemagic for production"
git push origin main
```

This will trigger the `web-preview` workflow automatically.

#### Option B: Trigger Production Builds
```bash
git tag v1.0.0
git push origin v1.0.0
```

This will trigger both `ios-production` and `android-production` workflows.

---

## 📊 Workflow Details

### 🌐 Web Preview Workflow

**File**: `codemagic.yaml` → `web-preview`

**Triggers**:
- Push to `main` branch
- Push to `develop` branch
- Push to any `feature/*` branch

**What it does**:
1. ✅ Installs Flutter dependencies
2. ✅ Runs code analysis (`flutter analyze`)
3. ✅ Runs tests with coverage
4. ✅ Builds production web app
5. ✅ Generates bundle size report
6. ✅ Publishes build artifacts

**Output**: `build/web/` folder ready for deployment

**Deploy to**:
- Firebase Hosting
- Vercel
- Netlify
- AWS S3/CloudFront
- Any static hosting

---

### 📱 iOS Production Workflow

**File**: `codemagic.yaml` → `ios-production`

**Triggers**:
- Git tags matching pattern: `v*.*.*` (e.g., v1.0.0, v2.1.3)

**What it does**:
1. ✅ Sets up code signing automatically
2. ✅ Installs dependencies
3. ✅ Builds signed IPA
4. ✅ Generates app size report
5. ✅ Uploads to TestFlight

**Output**: Signed `.ipa` file

---

### 🤖 Android Production Workflow

**File**: `codemagic.yaml` → `android-production`

**Triggers**:
- Git tags matching pattern: `v*.*.*`

**What it does**:
1. ✅ Sets up keystore for signing
2. ✅ Installs dependencies
3. ✅ Builds signed App Bundle (AAB)
4. ✅ Builds split APKs per ABI
5. ✅ Uploads to Google Play (internal track)

**Output**: 
- `.aab` file (for Play Store)
- `.apk` files (for direct distribution)

---

## 🔍 Verify Configuration

### Check if Codemagic sees your Flutter project:

When you add the app to Codemagic, it should detect:
- ✅ Flutter project in `flutter_app` folder
- ✅ `pubspec.yaml` at `flutter_app/pubspec.yaml`
- ✅ Multiple workflows in `codemagic.yaml`

### Check workflow list:

You should see 5 workflows:
1. Flutter Web - Production Build (`web-preview`)
2. iOS - Production Build (`ios-production`)
3. Android - Production Build (`android-production`)
4. Flutter Web - Staging Build (`web-staging`)
5. PR Quality Checks (`pr-check`)

---

## 🎨 Customization

### Change Flutter Version

In `codemagic.yaml`, update:
```yaml
environment:
  flutter: 3.24.0  # Specify exact version
  # OR
  flutter: stable  # Use latest stable
```

### Change Xcode Version

```yaml
environment:
  xcode: 15.0
  # OR
  xcode: latest
```

### Add Custom Scripts

Add steps to any workflow:
```yaml
scripts:
  - name: 📦 Custom step
    script: |
      cd flutter_app
      # Your custom commands here
```

### Modify Build Settings

```yaml
- name: 🏗️ Build with custom settings
  script: |
    cd flutter_app
    flutter build web \
      --release \
      --web-renderer html \
      --base-href /my-app/ \
      --dart-define=API_URL=https://api.example.com
```

---

## 🐛 Troubleshooting

### Issue: "Could not find pubspec.yaml"

**Solution**: Make sure `project_path: flutter_app` is set in the workflow's environment section.

### Issue: "Flutter command not found"

**Solution**: Ensure `flutter: stable` is in the environment section.

### Issue: "Code signing failed" (iOS)

**Solution**: 
1. Check App Store Connect integration is configured
2. Verify bundle ID matches in Codemagic and `ios/Runner.xcodeproj`
3. Ensure certificates are valid

### Issue: "Keystore not found" (Android)

**Solution**:
1. Verify `ANDROID_KEYSTORE_FILE` is base64 encoded correctly
2. Check all keystore environment variables are set
3. Ensure `key.properties` script runs before build

### Issue: Build takes too long

**Solution**:
1. Enable caching (already configured in YAML)
2. Use faster instance: `instance_type: mac_mini_m2`
3. Reduce test coverage if needed

---

## 📈 Best Practices

### 1. Use Environment Groups
Group related secrets together for easier management:
- `production_secrets`
- `staging_secrets`
- `app_store_credentials`
- `google_play_credentials`

### 2. Enable Caching
Already configured in all workflows:
```yaml
cache:
  cache_paths:
    - $HOME/.pub-cache
    - $FCI_BUILD_DIR/flutter_app/.dart_tool
```

### 3. Use Semantic Versioning
Tag releases properly:
```bash
git tag v1.0.0   # Major.Minor.Patch
git tag v1.0.1   # Patch update
git tag v1.1.0   # Minor update
```

### 4. Test Before Releasing
Always test on staging before production:
```bash
git checkout develop
git push origin develop  # Triggers web-staging workflow
```

### 5. Monitor Build Times
- Web builds: ~5-10 minutes
- iOS builds: ~15-30 minutes
- Android builds: ~10-20 minutes

---

## 🔗 Helpful Resources

- [Codemagic Docs](https://docs.codemagic.io/)
- [Flutter CI/CD Guide](https://docs.flutter.dev/deployment/cd)
- [Codemagic YAML Reference](https://docs.codemagic.io/yaml/yaml-getting-started/)
- [Codemagic Slack Community](https://codemagicio.slack.com/)

---

## ✅ Checklist

Before going live, ensure:

- [ ] Repository connected to Codemagic
- [ ] `codemagic.yaml` file in repository root
- [ ] Environment variable groups configured
- [ ] iOS code signing set up
- [ ] Android keystore configured
- [ ] Test build successful
- [ ] Notifications configured
- [ ] Team members added to Codemagic project

---

## 🎉 Success!

Once configured, your builds will:
- ✅ Run automatically on every push
- ✅ Build your real app (not the counter demo)
- ✅ Deploy to TestFlight and Google Play
- ✅ Provide detailed build reports
- ✅ Send notifications on success/failure

**You now have enterprise-grade CI/CD for your Flutter app!** 🚀

---

**Questions?** Check the [Codemagic docs](https://docs.codemagic.io/) or contact your DevOps team.
