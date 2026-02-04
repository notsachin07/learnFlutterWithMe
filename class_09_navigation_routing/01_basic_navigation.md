# Lesson 01: Basic Navigation

Learn the fundamentals of moving between screens in Flutter using the Navigator API.

---

## The Navigator Widget

The `Navigator` manages a **stack of Route objects**. Think of it like a stack of cards:
- Each screen is a card
- You can add cards on top (push)
- You can remove the top card (pop)
- You can always see what's on top

---

## Basic Navigation: Push and Pop

### Navigator.push()

Opens a new screen and adds it to the navigation stack.

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondScreen(),
  ),
);
```

**Breaking it down:**
- `context`: Current build context (always available in `build()`)
- `MaterialPageRoute`: Creates a platform-specific transition
- `builder`: Function that returns the new screen widget

### Navigator.pop()

Closes the current screen and returns to the previous one.

```dart
Navigator.pop(context);
```

---

## Complete Example: Two Screens

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// First screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate to second screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondScreen(),
              ),
            );
          },
          child: const Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

// Second screen
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Go back to first screen
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}
```

### What Happens Here?

1. App starts with `HomeScreen`
2. User taps "Go to Second Screen" → `Navigator.push()` adds `SecondScreen` to stack
3. `SecondScreen` appears with automatic back button in AppBar
4. User taps "Go Back" → `Navigator.pop()` removes `SecondScreen` from stack
5. App returns to `HomeScreen`

---

## Passing Data Forward (To New Screen)

Use constructor parameters to pass data to the new screen:

```dart
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Laptop'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productName: 'Laptop',
                    price: 999.99,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Headphones'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productName: 'Headphones',
                    price: 149.99,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final double price;

  const ProductDetailScreen({
    super.key,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              productName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Returning Data Backward (From Screen)

When you want to get data back from a screen, use `Navigator.pop()` with a value:

```dart
// Screen that waits for result
class SelectColorScreen extends StatelessWidget {
  const SelectColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Color')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Navigate and wait for result
            final selectedColor = await Navigator.push<Color>(
              context,
              MaterialPageRoute(
                builder: (context) => const ColorPickerScreen(),
              ),
            );

            // Use the returned color
            if (selectedColor != null) {
              print('User selected: $selectedColor');
            }
          },
          child: const Text('Pick a Color'),
        ),
      ),
    );
  }
}

// Screen that returns data
class ColorPickerScreen extends StatelessWidget {
  const ColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a Color')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16),
        children: [
          _buildColorTile(context, Colors.red, 'Red'),
          _buildColorTile(context, Colors.blue, 'Blue'),
          _buildColorTile(context, Colors.green, 'Green'),
          _buildColorTile(context, Colors.orange, 'Orange'),
          _buildColorTile(context, Colors.purple, 'Purple'),
          _buildColorTile(context, Colors.teal, 'Teal'),
        ],
      ),
    );
  }

  Widget _buildColorTile(BuildContext context, Color color, String name) {
    return GestureDetector(
      onTap: () {
        // Return the selected color
        Navigator.pop(context, color);
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
```

### How This Works:

1. `Navigator.push<Color>()` specifies the return type
2. The `await` keyword waits for the screen to close
3. `Navigator.pop(context, color)` returns the selected color
4. The first screen receives the color and can use it

---

## Async Navigation Pattern

Since navigation returns a `Future`, you can use `await`:

```dart
void navigateAndGetResult() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AnotherScreen()),
  );

  // This code runs AFTER the user comes back
  if (result != null) {
    print('Got result: $result');
  }
}
```

**Important**: Don't forget to check if `result != null` because the user might press the back button without selecting anything.

---

## The Back Button Behavior

Flutter automatically adds a back button to the AppBar when you navigate to a new screen.

### Handling the System Back Button

On Android, the system back button automatically calls `Navigator.pop()`.

To intercept it, use `WillPopScope`:

```dart
class ConfirmExitScreen extends StatelessWidget {
  const ConfirmExitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        // Return true to allow it
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to leave this screen?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Yes'),
              ),
            ],
          ),
        );

        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Confirm Exit')),
        body: const Center(
          child: Text('Press back button to see confirmation'),
        ),
      ),
    );
  }
}
```

---

## Navigator Methods Overview

### Navigation Methods

| Method | Description | Use Case |
|--------|-------------|----------|
| `push()` | Add new route on top | Go to new screen |
| `pop()` | Remove current route | Go back |
| `pushReplacement()` | Replace current with new | Login → Home (can't go back) |
| `pushAndRemoveUntil()` | Push and clear stack | Logout (remove all screens) |
| `popUntil()` | Pop multiple screens | Go back to specific screen |
| `canPop()` | Check if can go back | Disable back button conditionally |
| `maybePop()` | Pop only if can | Safe pop attempt |

### Examples

**pushReplacement()**: Replace current screen
```dart
// User completes onboarding, go to home without back button
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);
```

**pushAndRemoveUntil()**: Clear entire stack
```dart
// User logs out, remove all screens
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => LoginScreen()),
  (route) => false, // Remove all previous routes
);
```

**popUntil()**: Go back multiple screens
```dart
// Go back to home screen (first route)
Navigator.popUntil(context, (route) => route.isFirst);
```

---

## Complete Example: Multi-Screen Flow

```dart
// Home screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FormScreen(),
              ),
            );

            if (result != null && context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Form submitted: $result')),
              );
            }
          },
          child: const Text('Go to Form'),
        ),
      ),
    );
  }
}

// Form screen
class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void submit() {
    if (_controller.text.isNotEmpty) {
      Navigator.pop(context, _controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: submit,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Best Practices

### 1. Always Check Context Mounted

After async operations, check if the widget is still in the tree:

```dart
final result = await Navigator.push(...);

if (!context.mounted) return; // Widget was disposed

// Safe to use context here
ScaffoldMessenger.of(context).showSnackBar(...);
```

### 2. Use Generic Types for Type Safety

```dart
// Specify the return type
final String? name = await Navigator.push<String>(
  context,
  MaterialPageRoute(builder: (context) => NameInputScreen()),
);
```

### 3. Extract Route Building

```dart
// Instead of this:
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailsScreen(id: 123)),
);

// Create a method:
Route createDetailsRoute(int id) {
  return MaterialPageRoute(
    builder: (context) => DetailsScreen(id: id),
  );
}

// Use it:
Navigator.push(context, createDetailsRoute(123));
```

### 4. Clean Up Resources

Always dispose controllers and listeners when leaving a screen:

```dart
@override
void dispose() {
  _controller.dispose();
  _subscription.cancel();
  super.dispose();
}
```

---

## Common Patterns

### Pattern 1: Confirmation Before Navigation

```dart
void navigateWithConfirmation() async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirm'),
      content: const Text('Leave this page?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('OK'),
        ),
      ],
    ),
  );

  if (confirmed == true) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NextScreen()),
    );
  }
}
```

### Pattern 2: Navigation with Loading

```dart
void navigateWithLoading() async {
  // Show loading
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(
      child: CircularProgressIndicator(),
    ),
  );

  // Simulate data fetch
  await Future.delayed(const Duration(seconds: 2));

  if (!mounted) return;

  // Close loading dialog
  Navigator.pop(context);

  // Navigate to result screen
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ResultScreen()),
  );
}
```

### Pattern 3: Wizard/Stepper Navigation

```dart
class WizardFlow extends StatefulWidget {
  const WizardFlow({super.key});

  @override
  State<WizardFlow> createState() => _WizardFlowState();
}

class _WizardFlowState extends State<WizardFlow> {
  int currentStep = 0;
  final steps = ['Basic Info', 'Details', 'Review'];

  void nextStep() {
    if (currentStep < steps.length - 1) {
      setState(() => currentStep++);
    } else {
      // Finished
      Navigator.pop(context, 'Wizard completed');
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (currentStep > 0) {
          previousStep();
          return false; // Don't pop
        }
        return true; // Allow pop
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Step ${currentStep + 1} of ${steps.length}'),
        ),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: (currentStep + 1) / steps.length,
            ),
            Expanded(
              child: Center(
                child: Text('Content for: ${steps[currentStep]}'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  TextButton(
                    onPressed: previousStep,
                    child: const Text('Back'),
                  )
                else
                  const SizedBox(),
                ElevatedButton(
                  onPressed: nextStep,
                  child: Text(
                    currentStep == steps.length - 1 ? 'Finish' : 'Next',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## Summary

1. **`Navigator.push()`** opens a new screen
2. **`Navigator.pop()`** goes back to the previous screen
3. **Pass data forward** using constructor parameters
4. **Return data backward** using `Navigator.pop(context, data)`
5. **Use `await`** to wait for navigation results
6. **Check `context.mounted`** after async navigation
7. **Use `WillPopScope`** to intercept back button

---

## Next Steps

You now understand basic navigation! In the next lesson, we'll learn about **named routes** for cleaner, more maintainable navigation code.

Continue to [02_named_routes.md](./02_named_routes.md) →
