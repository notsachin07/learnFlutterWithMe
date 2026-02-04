# Class 09: Navigation & Routing

Welcome to Class 09! Now that you can build interactive widgets with state, it's time to learn how to **navigate between screens**. Multi-screen navigation is essential for any real-world Flutter application.

---

## 🎯 Learning Objectives

By the end of this class, you will be able to:

1. **Navigate** between screens using `Navigator.push()` and `Navigator.pop()`
2. **Pass data** to new screens via constructor parameters
3. **Return data** from screens back to the previous screen
4. **Use named routes** for cleaner navigation code
5. **Implement route guards** and navigation patterns
6. **Handle deep links** and custom transitions

---

## 🧠 Prerequisites

Before starting this class, make sure you understand:

- **Class 06**: Flutter Setup (Scaffold, MaterialApp)
- **Class 07**: Widgets & Layouts (building screen UIs)
- **Class 08**: State Management (passing data, callbacks)

Key concepts you should know:
- How to create a basic Flutter screen with `Scaffold`
- How to manage state with `setState()`
- How to pass data through constructor parameters

---

## 📚 What is Navigation?

**Navigation** is how users move between different screens (also called "routes" or "pages") in your app.

### Navigation Stack

Flutter uses a **navigation stack** (like a stack of cards):
- `push()`: Add a new screen on top
- `pop()`: Remove the top screen and go back

```
Stack visualization:
┌─────────────┐
│  Screen C   │ ← Current (top of stack)
├─────────────┤
│  Screen B   │
├─────────────┤
│  Screen A   │ ← Home (bottom of stack)
└─────────────┘

After pop():
┌─────────────┐
│  Screen B   │ ← Current (back to previous)
├─────────────┤
│  Screen A   │
└─────────────┘
```

---

## 🏗️ Navigation Methods

Flutter offers two main approaches:

### 1. Anonymous Routes (This Class - Basic)
- `Navigator.push()` and `Navigator.pop()`
- Create routes inline
- Good for: Small apps, simple navigation

### 2. Named Routes (This Class - Intermediate)
- Define routes in `MaterialApp`
- Navigate using route names (`'/home'`, `'/profile'`)
- Good for: Larger apps, easier to maintain

### 3. Advanced Routing (Future Classes)
- Go Router, Auto Route packages
- Type-safe navigation
- Good for: Complex apps, deep linking

---

## 📁 Class Structure

```
class_09_navigation_routing/
├── README.md                    ← You are here
├── 01_basic_navigation.md      ← push, pop, passing data
├── 02_named_routes.md          ← Named routes and route guards
├── main.dart                   ← Runnable examples
├── exercises.md                ← Practice problems
└── solutions/
    └── solution_09.dart        ← Reference implementations
```

---

## 🚀 How to Use This Class

### Step 1: Read the Lessons
Start with `01_basic_navigation.md` to understand push/pop, then move to `02_named_routes.md` for cleaner patterns.

### Step 2: Run the Examples
```bash
# Navigate to a Flutter project
cd your_flutter_project

# Copy main.dart to lib/main.dart
cp class_09_navigation_routing/main.dart lib/main.dart

# Run the app
flutter run
```

### Step 3: Complete the Exercises
Open `exercises.md` and build multi-screen apps with real-world navigation patterns.

### Step 4: Check Your Work
Compare your solutions with `solutions/solution_09.dart`.

---

## 🌍 Real-World Applications

Understanding navigation enables you to build:

| App Type | Navigation Examples |
|----------|---------------------|
| **E-commerce** | Home → Category → Product Details → Checkout |
| **Social Media** | Feed → Profile → Post Details → Comments |
| **Banking** | Dashboard → Transactions → Transaction Detail |
| **Settings** | Settings → Account → Edit Profile → Save |
| **Onboarding** | Welcome → Tutorial 1 → Tutorial 2 → Sign Up |

---

## ⏱️ Estimated Time

| Section | Time |
|---------|------|
| Lesson 01: Basic Navigation | 45 minutes |
| Lesson 02: Named Routes | 45 minutes |
| Examples (main.dart) | 30 minutes |
| Exercises | 90 minutes |
| **Total** | **~3.5 hours** |

---

## 💡 Key Concepts Preview

### Basic Navigation

```dart
// Navigate to new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailsScreen()),
);

// Go back
Navigator.pop(context);
```

### Passing Data

```dart
// Forward: Pass data to new screen
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProfileScreen(userId: 123),
  ),
);

// Backward: Return data when going back
Navigator.pop(context, 'Result data');
```

### Named Routes

```dart
// Define routes
MaterialApp(
  routes: {
    '/': (context) => HomeScreen(),
    '/profile': (context) => ProfileScreen(),
    '/settings': (context) => SettingsScreen(),
  },
);

// Navigate by name
Navigator.pushNamed(context, '/profile');
```

---

## 🔗 Connection to Future Classes

This class prepares you for:

- **Class 10**: Forms & Validation (multi-step forms with navigation)
- **Class 11**: Networking & APIs (navigation after login/data fetch)
- **Future**: Advanced routing with Go Router, deep linking

---

## ✅ Ready to Begin?

Start with [01_basic_navigation.md](./01_basic_navigation.md) to learn the fundamentals of moving between screens!

---

**Remember**: Every app you've ever used has navigation. Master this, and you can build complex, multi-screen experiences! 🚀
