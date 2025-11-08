# 🎯 Codemagic Setup - What to Enter

## Quick Answer

**Repository**: `https://github.com/airdispatchinc/blank-app`  
**Branch**: `main`  
**Configuration**: `codemagic.yaml`

---

## 📋 Step-by-Step Setup in Codemagic

### Step 1: Add Application

1. **Go to**: [codemagic.io](https://codemagic.io)
2. **Click**: "Add application" button
3. **Choose**: Your Git provider (GitHub)

---

### Step 2: Repository Selection

**What to enter**:

```
Repository: airdispatchinc/blank-app
```

Or select from the list of your repositories.

**Screenshot equivalent**:
```
┌─────────────────────────────────────┐
│ Select repository:                  │
│ ○ airdispatchinc/blank-app    ✓    │
│                                     │
│ [Next] →                            │
└─────────────────────────────────────┘
```

---

### Step 3: Project Setup Type

**Choose**: ✅ **Use codemagic.yaml**

```
┌─────────────────────────────────────┐
│ How would you like to set up your  │
│ project?                            │
│                                     │
│ ⦿ Use codemagic.yaml          ✓    │
│ ○ Configure manually                │
│                                     │
│ [Next] →                            │
└─────────────────────────────────────┘
```

**Why?**: This reads your `codemagic.yaml` file from the repo (already configured perfectly!)

---

### Step 4: Branch Configuration

**Default branch to build**: `main`

```
┌─────────────────────────────────────┐
│ Select branches to track:           │
│                                     │
│ Branch: main              ✓         │
│                                     │
│ Workflow triggers configured in:    │
│ codemagic.yaml                      │
│                                     │
│ [Finish setup] →                    │
└─────────────────────────────────────┘
```

**Note**: Your `codemagic.yaml` already defines which branches trigger builds:
- ✅ `main` (production)
- ✅ `develop` (staging)
- ✅ `feature/*` (development)

---

## 🎯 What Codemagic Will Detect Automatically

Once you select "Use codemagic.yaml", Codemagic will automatically find:

### ✅ 5 Workflows Detected

1. **web-preview** (Flutter Web - Production Build)
   - Triggers: Push to `main`, `develop`, `feature/*`
   - Builds: Web app

2. **ios-production** (iOS - Production Build)
   - Triggers: Git tags `v*.*.*` (e.g., v1.0.0)
   - Builds: iOS IPA

3. **android-production** (Android - Production Build)
   - Triggers: Git tags `v*.*.*`
   - Builds: Android AAB/APK

4. **web-staging** (Flutter Web - Staging Build)
   - Triggers: Push to `develop`, `staging`
   - Builds: Staging web app

5. **pr-check** (PR Quality Checks)
   - Triggers: Pull requests
   - Runs: Tests and analysis

**All configured automatically from your YAML!** ✅

---

## 📝 Configuration Screen Details

### After Setup, You'll See:

```
Project: blank-app
Repository: airdispatchinc/blank-app
Branch: main

Configuration:
┌─────────────────────────────────────┐
│ ✓ Using codemagic.yaml              │
│                                     │
│ Workflows found:                    │
│   • web-preview           ✓         │
│   • ios-production        ✓         │
│   • android-production    ✓         │
│   • web-staging          ✓         │
│   • pr-check             ✓         │
│                                     │
│ [Start first build] →               │
└─────────────────────────────────────┘
```

---

## 🚀 Triggering Your First Build

### Option 1: Manual Trigger (Easiest)

1. In Codemagic dashboard
2. Click your project: **blank-app**
3. Click **"Start new build"**
4. Select workflow: **web-preview**
5. Select branch: **main**
6. Click **"Start new build"**

```
┌─────────────────────────────────────┐
│ Start new build                     │
│                                     │
│ Workflow: web-preview        ▼     │
│ Branch:   main               ▼     │
│                                     │
│ [Start new build] →                 │
└─────────────────────────────────────┘
```

### Option 2: Push to Repository (Automatic)

Simply push any change to `main`:

```bash
# Make a small change
cd /path/to/your/local/repo
echo "# Build test" >> README.md
git add README.md
git commit -m "Trigger build"
git push origin main
```

**Codemagic will automatically start building!**

---

## ⚙️ Environment Variables (Optional)

If you want to add secrets later:

1. **Go to**: Project Settings → Environment variables
2. **Create groups** (if needed):
   - `production_secrets`
   - `staging_secrets`
   
**For now**: Not required! Your build works without any env variables.

**Add later** when you need:
- API keys
- Firebase credentials
- Signing certificates

---

## 🔐 Code Signing (Skip for Web)

### For Web Build (Your Current Setup)
**No code signing needed!** ✅

Web builds work immediately without certificates.

### For iOS (Future)
1. **Go to**: Code signing identities
2. **Connect**: App Store Connect API
3. **Let Codemagic**: Auto-generate certificates

### For Android (Future)
1. **Generate keystore** locally
2. **Base64 encode** it
3. **Add to**: Environment variables as `ANDROID_KEYSTORE_FILE`

**Skip these for now** - focus on web build first!

---

## 📊 What You'll See After Setup

### Dashboard View

```
┌──────────────────────────────────────────────┐
│ blank-app                           [main]   │
│                                              │
│ Workflows:                                   │
│   web-preview            ● Ready            │
│   ios-production         ● Ready            │
│   android-production     ● Ready            │
│   web-staging           ● Ready            │
│   pr-check              ● Ready            │
│                                              │
│ Latest build: -                             │
│ [Start new build]                           │
└──────────────────────────────────────────────┘
```

---

## 🎯 Expected Build Flow

### When You Click "Start new build":

1. **Codemagic clones**: `https://github.com/airdispatchinc/blank-app`
2. **Checks out**: `main` branch
3. **Reads**: `codemagic.yaml`
4. **Navigates to**: `flutter_app/` folder (via `working_directory`)
5. **Runs workflow**: `web-preview`

### Build Steps You'll See:

```
✓ Preparing build machine...
✓ Cloning repository...
✓ Checking out main branch...
✓ Reading codemagic.yaml...
✓ Setting up Flutter (stable)...

Running workflow: web-preview
  ✓ Get Flutter packages
  ✓ Clean previous builds
  ✓ Generate code (skipped)
  ✓ Run code analysis
  ✓ Run unit tests
  ✓ Build Flutter Web (Production)
  ✓ Bundle size analysis
  ✓ Optimize assets

✓ Build succeeded! (7 minutes)
📦 Artifacts: build/web/**
```

---

## ❌ Common Mistakes to Avoid

### ❌ DON'T Select "Configure manually"
**Why**: You already have `codemagic.yaml` - manual config will ignore it!

### ❌ DON'T Select Flutter as project type first
**Why**: Let Codemagic detect it from your YAML automatically.

### ❌ DON'T Add build steps in UI
**Why**: All build steps are in your YAML file already!

### ✅ DO Select "Use codemagic.yaml"
**Why**: This reads your perfect configuration!

---

## 🔍 Troubleshooting

### If Codemagic Can't Find codemagic.yaml

**Check**:
1. File is named exactly: `codemagic.yaml` (not `.yaml` or `yml`)
2. File is in repository root (not in `flutter_app/`)
3. File is committed and pushed to `main` branch

**Verify**:
```bash
cd /your/repo
ls -la | grep codemagic
# Should show: codemagic.yaml
```

### If No Workflows Are Detected

**Reason**: YAML syntax error

**Fix**: Check YAML is valid
```bash
# Verify syntax online
cat codemagic.yaml
# Copy and paste into: https://www.yamllint.com/
```

**Your YAML is valid** - this shouldn't happen! ✅

---

## 📋 Quick Reference Card

```
╔═══════════════════════════════════════╗
║  CODEMAGIC CONFIGURATION REFERENCE    ║
╠═══════════════════════════════════════╣
║ Repository:  airdispatchinc/blank-app ║
║ Branch:      main                     ║
║ Setup Type:  Use codemagic.yaml       ║
║ Main Flow:   web-preview              ║
║                                       ║
║ No manual configuration needed!       ║
║ Everything is in codemagic.yaml ✓    ║
╚═══════════════════════════════════════╝
```

---

## 🎉 That's It!

**Summary of what to enter**:

1. **Repository**: `airdispatchinc/blank-app` (or select from list)
2. **Setup method**: "Use codemagic.yaml" (not manual)
3. **Branch**: `main` (default)
4. **Click**: "Finish setup"
5. **Click**: "Start new build" to test

**Everything else is automatic!** Your `codemagic.yaml` file handles all the configuration.

---

**Next**: Start a build and watch it succeed! 🚀

**Expected time**: 5-8 minutes  
**Expected result**: ✅ Success + `build/web/**` artifact
