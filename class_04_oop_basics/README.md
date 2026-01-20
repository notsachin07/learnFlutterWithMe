# Class 04: OOP - Classes & Objects - Organizing Code Into Blueprints

**Builds on:** Class 01 (Variables, Types), Class 02 (Control Flow), Class 03 (Functions)

Welcome to Object-Oriented Programming (OOP). Classes are blueprints. Objects are instances created from those blueprints. Think: class = cookie cutter, object = actual cookie.

**Why does this matter?** 90% of Flutter is just combining classes together. A Flutter app is a tree of classes (Widgets)!

## 🎯 Learning Objectives
- ✅ Define a Class (blueprint) and create Objects (instances)
- ✅ Understand Properties (variables inside a class)
- ✅ Understand Methods (functions inside a class)
- ✅ **CRITICAL:** Master **Constructors** (initialize objects at creation time)
- ✅ Learn Named Constructors (multiple ways to create an object)
- ✅ Use Named Parameters in Constructors (Flutter style!)
- ✅ Combine class methods with logic from Class 02 (if/else, loops)

## 📚 What You'll Learn

### Section 1: Basic Classes and Objects
A class is a blueprint. Creating an object from a class is like using a cookie cutter:
```dart
class Robot {
  String name = "Bot";
  
  void speak() {
    print("I am $name");
  }
}

// Create two different robots (objects)
Robot bot1 = Robot();
bot1.name = "R2D2";
bot1.speak();  // Output: I am R2D2

Robot bot2 = Robot();
bot2.name = "C3PO";
bot2.speak();  // Output: I am C3PO
```

### Section 2: Constructors
Constructors run automatically when you create an object. Use them to set up initial values:
```dart
class Person {
  String name;
  String major;
  
  // Constructor: runs when you create a Person
  Person(this.name, this.major);
  
  void introduce() {
    print("I'm $name and I study $major");
  }
}

// Create a person with initial data
Person student = Person("Alex", "Computer Science");
student.introduce();  // Output: I'm Alex and I study Computer Science
```

### Section 3: Named Parameters in Classes (Flutter Style!)
Use `{}` in constructors just like functions from Class 03:
```dart
class CustomButton {
  String label;
  String color;
  bool isEnabled;
  
  // Constructor with named parameters (EXACTLY like Flutter!)
  CustomButton({
    required this.label,
    required this.color,
    this.isEnabled = true,
  });
}

// Use it like this:
var btn = CustomButton(
  label: "Submit",
  color: "Blue",
  isEnabled: true,
);
```

### Section 4: Methods with Conditional Logic
Methods can contain if/else and loops from Class 02:
```dart
class Smartphone {
  String brand;
  int batteryPercentage = 100;
  
  void useApp() {
    batteryPercentage -= 10;
    if (batteryPercentage <= 0) {
      print("Phone dead!");
    } else {
      print("Battery: $batteryPercentage%");
    }
  }
}
```

### Section 5: Named Constructors
Sometimes you want multiple ways to create an object:
```dart
class Rectangle {
  double width;
  double height;
  
  // Standard constructor
  Rectangle(this.width, this.height);
  
  // Named constructor: creates a square
  Rectangle.square(double size) {
    width = size;
    height = size;
  }
}

// Use it:
Rectangle rect = Rectangle(10, 5);           // Standard
Rectangle square = Rectangle.square(4);      // Named
```

## 🔗 Prerequisites
- Class 01 complete (variables, types)
- Class 02 complete (control flow)
- Class 03 complete (functions, named parameters)

## 🧠 Key Differences from Python
- **Self:** In Python, you write `self.variable`. In Dart, you use `this.variable` (or just `variable` if there's no ambiguity)
- **Init:** Python uses `def __init__`. Dart uses a function with the **same name** as the class
- **New:** In older languages (Java/C++), you use `new ClassName()`. In Dart, `new` is optional and usually skipped
- **Properties:** In Dart, you declare properties (variables) at the top of the class

## 📖 How to Use This Class

1. **Start with `main.dart`** — Run it and see 5 detailed sections with 4+ class examples
   ```bash
   dart main.dart
   ```

2. **Read the lesson modules:**
   - `01_classes_and_objects.md` — class basics and properties
   - `02_constructors.md` — constructors and initialization

3. **Try the exercises** in `exercises.md`:
   - The Smartphone Class (properties + methods)
   - The Rectangle Class (named constructors)
   - Flutter Simulation (TextWidget mimicking Flutter)

4. **Check solutions** in `solutions/solution_04.dart`
   ```bash
   dart solutions/solution_04.dart
   ```

## ⚡ Real-World Examples
- **Smartphone:** Brand, storage, battery management
- **Rectangle:** Geometry with named constructors for special cases
- **TextWidget:** Flutter-style UI widget simulation
- **User Profile:** Name, email, role, permissions
- **Game Character:** Health, inventory, special abilities

## 🚀 Why This Matters for Flutter

Every Flutter widget is a class:
```dart
AppBar(          // This is a class
  title: Text("Home"),    // Text is a class
  actions: [...],
)
```

When you write Flutter code, you're combining classes with named parameters. This class teaches you exactly that pattern!

## 📊 Progression Summary
```
Class 01: Variables (data storage)
    ↓
Class 02: Control Flow (data decisions)
    ↓
Class 03: Functions (reusable code)
    ↓
Class 04: Classes (organized reusable code + data)
    ↓
Flutter: Trees of Classes (combine them into apps!)
```

## 🎯 What's Next?
You're now ready for **Flutter!** All four classes prepare you to:
- Understand Dart fundamentals
- Think in terms of classes and objects
- Use named parameters (core Flutter pattern)
- Write clean, organized code

Start building UI with Flutter widgets, which are just classes you've learned about here.