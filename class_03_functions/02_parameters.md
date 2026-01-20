# Lesson 3.2: Parameters - Positional vs. Named (CRITICAL FOR FLUTTER!)

**Builds on:** Lesson 3.1 (Function Structure) & Class 02 (Control Flow)

This is the most important concept for understanding Flutter. Flutter widgets use named parameters extensively. Master this now, and Flutter will feel natural!

## 🎯 What You'll Learn
- Understand positional parameters (order matters)
- Understand named parameters (you use names)
- Combine positional and named parameters
- Use default values for parameters
- Use `required` keyword for mandatory parameters

## 1. Positional Parameters (The Standard)

Order matters. If `name` is first, you must pass `name` first.

### Basic Example
```dart
void introduce(String name, int age) {
  print("$name is $age");
}

// Usage: Must pass name first, then age
introduce("Sachin", 20);  // Works ✓
introduce(20, "Sachin");  // Error! ✗ Types don't match
```

### Multiple Positional Parameters
```dart
void createUser(String username, String email, int age) {
  print("User: $username");
  print("Email: $email");
  print("Age: $age");
}

// Usage: Must be in this exact order
createUser("alex_dev", "alex@email.com", 22);
```

### The Problem with Positional Parameters
```dart
// This function has 5 positional parameters!
void createProfile(String name, String email, String phone, String address, String city) {
  // ...
}

// Which is which? Easy to mix up!
createProfile("alex@email.com", "Alex", "123-456-7890", "Main St", "Boston");
```

## 2. Named Parameters (The Flutter Way!)

Use `{}` instead of `()`. You pass parameters by name, so order doesn't matter!

### Basic Named Parameters
```dart
void introduce({required String name, required int age}) {
  print("$name is $age");
}

// Usage: Use parameter names
introduce(name: "Sachin", age: 20);  // Works ✓
introduce(age: 20, name: "Sachin");  // Also works! ✓ (order doesn't matter)
```

### Named Parameters with Defaults
```dart
void createUser({
  required String username,
  String role = "user",        // Default value
  bool isActive = true,        // Default value
}) {
  print("User: $username, Role: $role, Active: $isActive");
}

// Usage 1: Provide only required
createUser(username: "alex_dev");
// Output: User: alex_dev, Role: user, Active: true

// Usage 2: Override defaults
createUser(
  username: "admin_dev",
  role: "admin",
  isActive: true,
);
// Output: User: admin_dev, Role: admin, Active: true
```

### Real-World Example: Creating a User Profile
```dart
void createProfile({
  required String name,
  required String email,
  String bio = "No bio provided",
  int followers = 0,
  bool isVerified = false,
}) {
  print("Name: $name");
  print("Email: $email");
  print("Bio: $bio");
  print("Followers: $followers");
  print("Verified: $isVerified");
}

// Call with only required params
createProfile(
  name: "Alex",
  email: "alex@example.com",
);

// Call with optional params
createProfile(
  name: "Jordan",
  email: "jordan@example.com",
  bio: "Flutter developer",
  followers: 1500,
  isVerified: true,
);
```

## 3. Mixed Parameters (Positional + Named)

Combine both: positional parameters come first (required order), then named parameters.

### Basic Example
```dart
void uploadFile(String fileName, {required String destination}) {
  print("Uploading $fileName to $destination");
}

// Usage
uploadFile("data.csv", destination: "/uploads");
```

### More Complex Example
```dart
void sendMessage(
  String message,                    // Positional - required
  String recipient,                  // Positional - required
  {
    String priority = "normal",      // Named - optional with default
    bool urgent = false,             // Named - optional with default
  }
) {
  print("To: $recipient");
  print("Message: $message");
  print("Priority: $priority");
  print("Urgent: $urgent");
}

// Usage
sendMessage("Hello!", "alice@email.com");
sendMessage(
  "Important update",
  "bob@email.com",
  priority: "high",
  urgent: true,
);
```

## 4. Optional Parameters (Older Syntax)

Before named parameters, optional positional parameters used `[]`:

```dart
void greet(String name, [String greeting = "Hello"]) {
  print("$greeting, $name!");
}

greet("Alex");                      // Output: Hello, Alex!
greet("Alex", "Hi");                // Output: Hi, Alex!
```

**Note:** Named parameters are preferred in modern Dart/Flutter!

## 5. Real-World Examples

### Example 1: Device Configuration
```dart
void configureDevice({
  required String brand,
  required String model,
  int storage = 128,
  int ram = 4,
  String color = "Black",
}) {
  print("Device: $brand $model");
  print("Specs: ${ram}GB RAM, ${storage}GB Storage");
  print("Color: $color");
}

// Usage
configureDevice(
  brand: "Apple",
  model: "iPhone 14",
  storage: 256,
  ram: 6,
  color: "Blue",
);
```

### Example 2: Temperature Converter with Options
```dart
String convertTemp(
  double value,
  {
    String from = "celsius",
    String to = "fahrenheit",
    int precision = 2,
  }
) {
  double result = value;
  if (from == "celsius" && to == "fahrenheit") {
    result = (value * 9/5) + 32;
  }
  return result.toStringAsFixed(precision);
}

// Usage
print(convertTemp(25));                          // Default
print(convertTemp(25, precision: 1));            // 1 decimal
print(convertTemp(77, from: "fahrenheit"));      // Different units
```

## ⭐ Why Named Parameters Matter for Flutter

In Flutter, you write code that looks like this:

```dart
// Flutter code (this is exactly what you'll write!)
Container(
  width: 100,
  height: 100,
  color: Colors.blue,
  child: Text("Hello"),
  padding: EdgeInsets.all(16),
)
```

This is calling a constructor (a function!) with **named parameters**:
- `width: 100` — named parameter
- `height: 100` — named parameter
- `color: Colors.blue` — named parameter
- `child: Text("Hello")` — named parameter

Because parameters are named, order doesn't matter! You can write:
```dart
Container(
  child: Text("Hello"),
  color: Colors.blue,
  width: 100,
  height: 100,
  padding: EdgeInsets.all(16),
)
```

Same order or different—it works because they're **named** parameters!

## 📊 Comparison Table

| Feature | Positional | Named |
|---------|-----------|-------|
| Order | Matters | Doesn't matter |
| Syntax | `(a, b)` | `{required a, required b}` |
| Clarity | Can be confusing | Crystal clear |
| Flutter Use | Rarely used | Everywhere! |
| Required | All parameters required | Can have defaults |

## 🔄 Connection to Other Classes

- **Class 03:** Functions use parameters (this lesson)
- **Class 04:** Class constructors use named parameters (next class)
- **Flutter:** Every widget constructor uses named parameters
- **Best Practice:** Always use named parameters for better code readability

---

**Next:** Move to Class 04 (OOP - Classes & Objects) where you'll use named parameters in constructors!