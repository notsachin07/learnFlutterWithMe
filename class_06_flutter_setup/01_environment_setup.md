# Lesson 6.1: Environment Setup & Installation 🛠️

**Builds on:** Basic command-line knowledge, understanding of development environments

## What You'll Do in This Lesson

By the end of this lesson, you'll have:
- ✅ Flutter SDK installed and working
- ✅ Android/iOS development tools configured
- ✅ Verified installation with `flutter doctor`
- ✅ Your first Flutter app created and ready to run

## Part 1: Understanding Flutter Architecture

Before installing, understand what you're installing:

```
┌─────────────────────────────────────────────────────────┐
│                    Your Flutter App                     │
│              (Written in Dart, looks beautiful)         │
├─────────────────────────────────────────────────────────┤
│                   Flutter Framework                     │
│       (Provides widgets, layouts, state management)     │
├─────────────────────────────────────────────────────────┤
│                     Dart Engine                         │
│        (Compiles and runs your Dart code)               │
├─────────────────────────────────────────────────────────┤
│              Platform-Specific Code                    │
│         Android     │       iOS       │      Web        │
│      (Java/Kotlin)  │    (Swift/ObjC)  │   (JavaScript) │
├─────────────────────────────────────────────────────────┤
│           Operating System (Android/iOS/etc)            │
└─────────────────────────────────────────────────────────┘
```

**Key insight:** Flutter lets you write ONCE, deploy EVERYWHERE! Same Dart code compiles to native apps on multiple platforms.

## Part 2: Step-by-Step Installation

### For macOS (most detailed - adjust for your OS)

#### Step 1: Download Flutter SDK

```bash
# Navigate to home directory
cd ~

# Clone Flutter SDK from GitHub
git clone https://github.com/flutter/flutter.git -b stable

# This creates a `flutter` folder in your home directory
# The SDK is now ready to use!
```

#### Step 2: Add Flutter to PATH

Your PATH tells your computer where to find executables. We need to add Flutter's `bin` folder.

```bash
# Open your shell configuration file
nano ~/.zshrc    # For zsh (default on newer macOS)
# or
nano ~/.bash_profile  # For bash (older macOS)

# Add this line at the end of the file:
export PATH="$PATH:~/flutter/bin"

# Save and exit (Ctrl+X, then Y, then Enter)

# Apply the changes
source ~/.zshrc
```

#### Step 3: Verify Installation

```bash
# Check if flutter command is recognized
flutter --version

# This should show version info if successful!
# Example output: Flutter 3.16.1 • channel stable
```

#### Step 4: Run Flutter Doctor

```bash
flutter doctor
```

This is your **new best friend**. It checks:
- ✅ Flutter SDK
- ✅ Android toolchain
- ✅ Xcode (for iOS)
- ✅ Connected devices

Example output:

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.16.1, on macOS 13.1)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
[!] Chrome - develop for the web
[✓] Android Studio (version 2022.1)
[✓] VS Code (version 1.85.1)
[!] Connected device (No devices detected)

! Doctor found issues in 2 categories.
```

**Legend:**
- ✅ Green checkmark = installed and configured
- ! = warning (not critical for basics)
- ✗ Red X = missing (may need installation)

### For Windows

```powershell
# Download from: https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.16.1-stable.zip
# OR use Git

git clone https://github.com/flutter/flutter.git -b stable

# Add to PATH via System Environment Variables
# 1. Right-click "This PC" → Properties
# 2. Click "Advanced system settings"
# 3. Click "Environment Variables"
# 4. Add C:\path\to\flutter\bin to PATH

# Verify
flutter --version
```

### For Linux

```bash
# Install via package manager (Fedora example)
sudo dnf install flutter

# Or download and setup PATH like macOS
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:~/flutter/bin"
```

## Part 3: Resolving Common Issues

### Issue 1: "flutter command not found"

```bash
# Solution 1: Verify PATH is set
echo $PATH

# Solution 2: Restart terminal after editing ~/.zshrc

# Solution 3: Manually add to current session
export PATH="$PATH:~/flutter/bin"
```

### Issue 2: Android SDK Not Found

```bash
# Run with verbose to see what's missing
flutter doctor -v

# Then install what's missing (usually Android SDK)
# Via Android Studio: Preferences → SDK Manager
```

### Issue 3: Xcode Not Found (macOS)

```bash
# Install Xcode from App Store (large download: ~12GB)
# Then run:
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer

# Verify
flutter doctor
```

## Part 4: Understanding Project Structure

When you create a Flutter project with `flutter create my_app`, you get:

```
my_app/
├── android/              # Android-specific code (Java/Kotlin)
├── ios/                  # iOS-specific code (Swift)
├── lib/                  # 🚀 YOUR DART CODE GOES HERE
│   └── main.dart         # Entry point of your app
├── test/                 # Unit tests
├── pubspec.yaml          # Project dependencies (like package.json)
├── README.md             # Documentation
└── .gitignore            # Git ignore file
```

**Most important files:**
- `lib/main.dart` — Your app code (where you write!)
- `pubspec.yaml` — Project configuration and dependencies
- `android/` & `ios/` — Platform-specific code (rarely touch these)

## Part 5: Understanding pubspec.yaml

This file defines your project:

```yaml
name: my_app
description: My first Flutter app!
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
```

**Key sections:**
- `name` — Your app name
- `dependencies` — External packages (similar to npm packages)
- `flutter` — Flutter-specific configuration
- `version` — Your app version (for App Store)

## Part 6: Common Commands You'll Use

```bash
# Create a new project
flutter create my_app

# Navigate to project
cd my_app

# Run the app
flutter run

# Stop running app
Ctrl+C

# Hot reload (update without restart)
r

# Hot restart (full app restart)
R

# List available devices
flutter devices

# Run on specific device
flutter run -d <device_id>

# Build for release
flutter build apk      # Android
flutter build ios      # iOS
flutter build web      # Web
```

## Part 7: Your First Success Checkpoint

You've successfully set up Flutter when:

```bash
✅ flutter --version              # Shows version
✅ flutter doctor                 # Mostly green checkmarks
✅ flutter create test_app        # Creates project without errors
✅ cd test_app && flutter run     # App launches in emulator/device
```

## Key Concepts to Remember

1. **Flutter = Dart Framework** — You write Dart, Flutter provides the UI layer
2. **One codebase, multiple platforms** — Same code for Android, iOS, Web
3. **Hot reload** — Development superpower (see changes instantly)
4. **pubspec.yaml** — Central place for dependencies and configuration
5. **Platform-specific code** — Android/ and ios/ directories exist but rarely needed for beginners

## Next Steps

✅ Install Flutter SDK
✅ Run `flutter doctor` until mostly passing
✅ Create a test project: `flutter create test_app`
✅ Run the test project: `flutter run`

Once you see your first Flutter app on screen, move to **Lesson 6.2: Creating & Running Your First App** 🎯

---

## Troubleshooting Flowchart

```
Error running Flutter?
│
├─ "flutter not found" → Check PATH setup
├─ Android SDK error → Install via Android Studio
├─ Xcode error (macOS) → Install Xcode from App Store
├─ Device not found → Ensure emulator is running
├─ Permission denied → Check file permissions (chmod +x)
└─ Other error → Run: flutter doctor -v
```

**Pro tip:** Save the output of `flutter doctor` for troubleshooting. It tells you exactly what's missing! 🔧

