# Lesson 6.2: Creating & Running Your First App 🎯

**Builds on:** Lesson 6.1 (Environment Setup), understanding of project structure

## What You'll Learn

- Creating a new Flutter project from scratch
- Understanding the generated project structure
- Running your app on an emulator or device
- Understanding StatelessWidget and main()
- Making your first changes to the app
- Hot reload workflow

## Part 1: Creating Your First Flutter Project

### Step 1: Open Terminal

```bash
# Navigate to where you want your projects
cd ~/projects
# or wherever you organize your development work
```

### Step 2: Create New Project

```bash
flutter create my_first_app
```

This command does A LOT:

```
Creating project my_first_app...
  my_first_app/pubspec.yaml (created)
  my_first_app/README.md (created)
  my_first_app/.gitignore (created)
  my_first_app/.metadata (created)
  my_first_app/lib/ (created)
  my_first_app/lib/main.dart (created)
  my_first_app/test/ (created)
  ... (many more files for Android, iOS)
Running "flutter pub get" in my_first_app...
```

**What just happened?**
- ✅ Created project folder structure
- ✅ Generated platform-specific code (Android, iOS)
- ✅ Created example app code
- ✅ Downloaded dependencies

### Step 3: Navigate to Project

```bash
cd my_first_app
```

### Step 4: List Project Files

```bash
ls -la

# You should see:
# android/          - Android-specific code
# ios/              - iOS-specific code
# lib/              - YOUR DART CODE
# test/             - Tests
# pubspec.yaml      - Configuration
# pubspec.lock      - Locked versions
# README.md         - Documentation
```

## Part 2: Understanding the Generated Code

Let's look at `lib/main.dart`:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### Breaking Down the Code

#### 1. Main Entry Point

```dart
void main() {
  runApp(const MyApp());
}
```

**Explanation:**
- `main()` — Your app starts here (like in Classes 01-05!)
- `runApp()` — Tells Flutter what widget to display
- `const MyApp()` — Creates the root widget

#### 2. Root Widget (MyApp)

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

**Explanation:**
- `StatelessWidget` — Widget that doesn't change (like a photo)
- `build()` — Describes what the UI looks like
- `MaterialApp` — Google's Material Design wrapper
- `theme` — Styling (colors, fonts)
- `home` — The first screen to show

#### 3. Home Page (with state)

```dart
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
```

**Explanation:**
- `StatefulWidget` — Widget that can change (like a video)
- Uses a separate `State` class (`_MyHomePageState`) to hold the actual state

#### 4. State Implementation

```dart
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;  // This is the STATE

  void _incrementCounter() {
    setState(() {
      _counter++;  // Update the state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('$_counter'),  // Displays current counter
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,  // Call when tapped
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

**Explanation:**
- `_counter` — The state (number of times button pressed)
- `setState()` — Updates state and rebuilds UI
- `Scaffold` — Basic Material Design layout
- `AppBar` — Top bar with title
- `FloatingActionButton` — Button that triggers state change

## Part 3: Running Your App

### Prerequisite: Start Emulator or Connect Device

**Option A: Android Emulator**
```bash
# Open Android Studio
# Tools → Device Manager → Create Virtual Device
# Launch the device
```

**Option B: iOS Simulator (macOS only)**
```bash
open -a Simulator
```

**Option C: Physical Device**
```bash
# Connect your phone via USB
# Enable Developer Mode
```

### Run the App

```bash
flutter run

# Output should show:
# Launching lib/main.dart on Android Emulator in debug mode...
# ✓ Built build/app/outputs/flutter-apk/app-debug.apk
# Installing and launching the application...
# ✓ App launched successfully

# Your app is now running!
```

### What You See

- **Blue app bar** at top with title "Flutter Demo Home Page"
- **Text** in center saying "You have pushed the button this many times:"
- **Number "0"** displayed
- **Floating action button** (blue circle with plus icon) at bottom right

### Try Pressing the Button

When you tap the **+** button:
1. `_incrementCounter()` is called
2. `setState()` updates `_counter++`
3. `build()` is called again
4. UI rebuilds with new counter value
5. Number increments: 0 → 1 → 2 → 3...

## Part 4: Hot Reload - Your Development Superpower

This is what makes Flutter amazing!

### Edit the App Code

Open `lib/main.dart` and find this line:

```dart
const Text('You have pushed the button this many times:'),
```

Change it to:

```dart
const Text('🎯 YOU CLICKED THE BUTTON THIS MANY TIMES: 🎯'),
```

### Hot Reload

**In the terminal where app is running**, press:

```
r
```

**Result:** The app updates INSTANTLY without restarting! ⚡

This is the difference between Flutter and traditional mobile development. Instead of waiting 2-3 minutes for a rebuild, you see changes in 1 second!

### Hot Restart vs Hot Reload

```bash
r    # Hot reload - keeps app state, updates UI
R    # Hot restart - full restart, loses app state
```

**When to use:**
- **Hot reload** — UI changes, fixing logic bugs
- **Hot restart** — Added new files, changed dependencies, lost app stability

## Part 5: Your First Meaningful Change

Let's change the app to show something cool!

### Change 1: Update App Title

Find:
```dart
return MaterialApp(
  title: 'Flutter Demo',
```

Change to:
```dart
return MaterialApp(
  title: 'My Awesome App',
```

Hot reload with `r`. Notice the title changes!

### Change 2: Change Theme Color

Find:
```dart
theme: ThemeData(
  primarySwatch: Colors.blue,
),
```

Change to:
```dart
theme: ThemeData(
  primarySwatch: Colors.purple,
),
```

Hot reload! The app bar and button are now purple! 💜

### Change 3: Update Button Text

Find:
```dart
child: const Icon(Icons.add),
```

Change to:
```dart
child: const Icon(Icons.favorite),
```

Hot reload! The plus icon is now a heart! ❤️

## Part 6: Understanding the Widget Tree

Your app structure looks like:

```
MyApp (StatelessWidget)
  └── MaterialApp
        ├── theme: ThemeData(primarySwatch: Colors.purple)
        ├── home: MyHomePage
              └── Scaffold
                    ├── appBar: AppBar
                    │         └── Text(title)
                    ├── body: Center
                    │       └── Column
                    │             ├── Text("You have pushed...")
                    │             └── Text(_counter)
                    └── floatingActionButton: FloatingActionButton
                                          └── Icon(Icons.favorite)
```

**Key insight:** Flutter builds UIs by composing widgets. Each widget is a small, reusable piece!

## Part 7: Common Errors & Solutions

### Error: "No connected devices"

```bash
# Solution: Start emulator first
flutter devices  # See available devices
flutter run -d <device_id>
```

### Error: Hot reload doesn't work

```bash
# Solution: Try hot restart
R

# Or run app again
flutter run
```

### Error: "lib/main.dart" not found

```bash
# Solution: Make sure you're in the project root
cd my_first_app
flutter run
```

## Key Concepts to Remember

1. **StatelessWidget** — UI that doesn't change
2. **StatefulWidget** — UI that can change based on state
3. **setState()** — Trigger rebuild when state changes
4. **Hot reload** — See changes instantly (development advantage)
5. **Widget tree** — App structure as nested widgets
6. **Scaffold** — Basic Material Design layout structure

## Checkpoint: You've Succeeded When

✅ App runs on emulator/device
✅ Button increments counter
✅ Hot reload works (press `r`)
✅ You can change theme colors
✅ You understand StatelessWidget vs StatefulWidget

---

**Next:** Move to exercises in `exercises.md` to practice building widgets! 🎨

