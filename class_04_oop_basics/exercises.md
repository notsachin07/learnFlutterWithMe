# Class 04 Exercises - Master Objects & Constructors! 🏗️

**Builds on:** Class 01 (Variables, Types), Class 02 (Conditionals, Loops), Class 03 (Functions), Class 04 lessons (Classes, Constructors, Named Parameters)

Welcome to Object-Oriented Programming! These exercises teach you how to design classes, write constructors, and create objects—the foundation of large-scale programming and Flutter development.

---

## Exercise 1: The Smartphone Class 📱

**Objective:** Create a class with properties, a constructor, and a method.

**Why This Exercise?**
This teaches the fundamental pattern of class design. In the real world, a Smartphone is an excellent example: it has properties (brand, storage) and methods (useApp, charge). This mirrors Flutter widget design patterns.

### What You Need to Do:

Create a **`Smartphone` class** with:

**Properties:**
- `brand` (String) — brand name (e.g., "Apple", "Samsung")
- `storage` (int) — storage in GB (e.g., 128, 256)
- `batteryPercentage` (int) — current battery percentage (0-100)

**Constructor:**
- Takes `brand` and `storage` as parameters
- Sets `batteryPercentage` to 100 by default (new phone has full battery)

**Method:**
- `useApp()` — reduces battery by 10%, prints `"Using app... Battery at {percentage}%"`

**In `main()`:**
1. Create a Smartphone instance: `var phone = Smartphone("Samsung", 256);`
2. Call `useApp()` three times to show battery draining
3. Show how the object maintains state (battery gets lower each call)

### Example Output:
```
Using app... Battery at 90%
Using app... Battery at 80%
Using app... Battery at 70%
```

### Key Concepts Tested:
- ✅ Class definition with properties
- ✅ Constructor to initialize values
- ✅ Methods that modify object state
- ✅ Object instantiation with `new` keyword (or without)
- ✅ State persistence (battery value changes)

### Class Structure:
```dart
class Smartphone {
  String brand;
  int storage;
  int batteryPercentage;
  
  // Constructor
  Smartphone(String brand, int storage) {
    this.brand = brand;
    this.storage = storage;
    this.batteryPercentage = 100;
  }
  
  // Method
  void useApp() {
    batteryPercentage -= 10;
    print("Using app... Battery at $batteryPercentage%");
  }
}
```

### Hints:
- Use `this.property = value;` to assign constructor parameters to object properties
- Inside a method, you can access properties with just the name: `batteryPercentage -= 10;`
- Objects remember their state: each call to `useApp()` uses the CURRENT battery value

### Steps to Solve:
1. Create `solutions/solution_04.dart`
2. Define the `Smartphone` class with properties
3. Write the constructor (takes brand and storage, sets battery to 100)
4. Write the `useApp()` method (reduce battery by 10)
5. In `main()`, create a Smartphone and call `useApp()` multiple times
6. Run it: `dart solutions/solution_04.dart`

### Challenge (Optional):
- Add a `charge()` method that increases battery by 20% (cap at 100%)
- Add properties: `color`, `year`, `RAM`
- Track how many times the app was used (use a counter variable)
- Create multiple phones and compare them

---

## Exercise 2: The Rectangle (Constructor Logic) 📐

**Objective:** Create a class with multiple constructors and constructor logic/validation.

**Why This Exercise?**
Real-world objects often have multiple ways to be created. A rectangle can be created with width/height, or created as a square. This teaches named constructors—a pattern you'll use constantly in Flutter (e.g., `Container.fromColor()`).

### What You Need to Do:

Create a **`Rectangle` class** with:

**Properties:**
- `width` (double)
- `height` (double)

**Methods:**
- `getArea()` — returns `width * height`
- `getPerimeter()` — returns `2 * (width + height)`

**Constructors:**
1. **Standard Constructor:** `Rectangle(double width, double height)`
2. **Named Constructor:** `Rectangle.square(double size)` — creates a square (width = height = size)

**In `main()`:**
1. Create a normal rectangle: `Rectangle(5, 3)`
2. Create a square: `Rectangle.square(4)`
3. Print the area and perimeter of each

### Example Output:
```
Rectangle 5x3:
Area: 15
Perimeter: 16

Square 4x4:
Area: 16
Perimeter: 16
```

### Key Concepts Tested:
- ✅ Standard constructors
- ✅ Named constructors (with `.name` syntax)
- ✅ Constructor with logic/calculations
- ✅ Multiple methods on a class
- ✅ Different ways to construct objects

### Class Structure:
```dart
class Rectangle {
  double width;
  double height;
  
  // Standard Constructor
  Rectangle(double width, double height) {
    this.width = width;
    this.height = height;
  }
  
  // Named Constructor for squares
  Rectangle.square(double size) {
    this.width = size;
    this.height = size;
  }
  
  double getArea() => width * height;
  double getPerimeter() => 2 * (width + height);
}
```

### Hints:
- Named constructors use the syntax: `ClassName.constructorName(parameters) { ... }`
- You can have logic in constructors (like setting both width/height to the same value)
- Call named constructors: `Rectangle.square(5);` NOT `Rectangle(5);`

### Steps to Solve:
1. Define the `Rectangle` class with width and height properties
2. Write the standard constructor
3. Write the `Rectangle.square(double size)` named constructor
4. Write `getArea()` and `getPerimeter()` methods
5. In `main()`, create both a regular rectangle and a square
6. Call both methods and print results
7. Run it: `dart solutions/solution_04.dart`

### Challenge (Optional):
- Add `Rectangle.copy(Rectangle other)` — creates a copy of another rectangle
- Add `Rectangle.fromArea(double area, double width)` — calculates height from area
- Add an `isSquare()` method that returns true if width equals height
- Add property validation: prevent negative dimensions

---

## Exercise 3: Flutter Simulation (Named Parameter Constructor) 🎨

**Objective:** Create a class that mimics Flutter widget constructor patterns.

**Why This Exercise?**
This is the most important exercise for Flutter preparation! Flutter widgets like `Text`, `Container`, `Button` all use named parameter constructors extensively. By mastering this pattern now, Flutter development becomes intuitive.

### What You Need to Do:

Create a **`TextWidget` class** (mimicking Flutter's `Text` widget) with:

**Properties:**
- `text` (String) — the text to display
- `color` (String) — text color
- `fontSize` (int) — font size in pixels

**Constructor Requirements:**
- Use **named parameters** with `{ }`
- `text` is **required** (use `required` keyword)
- `color` has default value: `"Black"`
- `fontSize` has default value: `14`

**In `main()`:**
1. Create instances exactly like this (Flutter style!):
```dart
var header = TextWidget(text: "Welcome Home", fontSize: 24);
var subtitle = TextWidget(text: "Subtitle", color: "Blue", fontSize: 18);
var button = TextWidget(text: "Click Me");
```

2. Print information about each widget

### Example Output:
```
========= TEXT WIDGET =========
Text: "Welcome Home"
Color: Black
Size: 24px

========= TEXT WIDGET =========
Text: "Subtitle"
Color: Blue
Size: 18px

========= TEXT WIDGET =========
Text: "Click Me"
Color: Black
Size: 14px
```

### Key Concepts Tested:
- ✅ Named parameter constructors (Flutter pattern!)
- ✅ Required parameters
- ✅ Default parameter values
- ✅ Object instantiation with named syntax
- ✅ Flexibility without verbosity

### Class Structure:
```dart
class TextWidget {
  String text;
  String color;
  int fontSize;
  
  TextWidget({
    required this.text,
    this.color = "Black",
    this.fontSize = 14,
  });
  
  void display() {
    print("========= TEXT WIDGET =========");
    print('Text: "$text"');
    print("Color: $color");
    print("Size: ${fontSize}px");
  }
}
```

### Hints:
- **IMPORTANT:** Use `required` keyword for mandatory parameters
- Default values go in the function signature: `String color = "Black"`
- Call with named syntax: `TextWidget(text: "Hello", fontSize: 20);`
- The order doesn't matter with named parameters!

### Steps to Solve:
1. Create the `TextWidget` class
2. Define properties: `text`, `color`, `fontSize`
3. Write constructor with named parameters (required + defaults)
4. Add a `display()` method that prints widget info (or override `toString()`)
5. In `main()`, create the three instances exactly as shown
6. Print each widget's information
7. Run it: `dart solutions/solution_04.dart`

### Challenge (Optional):
- Add properties: `fontWeight`, `alignment`, `maxLines`
- Create a `Button` widget with similar structure
- Create a `Container` widget with background color and child widget
- Make it return a formatted String instead of printing

---

## How to Test Your Solutions

For each exercise:

1. **Create the file:** `solutions/solution_04.dart`
2. **Type the code** (don't copy-paste)
3. **Run it:** `dart solutions/solution_04.dart`
4. **Check output:** Compare with examples
5. **Debug errors:** Read messages carefully
6. **Try challenges:** Extend your code

---

## Class Design Patterns Reference

### Pattern 1: Simple Class
```dart
class Dog {
  String name;
  int age;
  
  Dog(String name, int age) {
    this.name = name;
    this.age = age;
  }
  
  void bark() {
    print("$name says: Woof!");
  }
}
```

### Pattern 2: Multiple Constructors (Named)
```dart
class Point {
  double x;
  double y;
  
  Point(double x, double y) {
    this.x = x;
    this.y = y;
  }
  
  Point.origin() {
    this.x = 0;
    this.y = 0;
  }
}
```

### Pattern 3: Named Parameter Constructor (Flutter Style!)
```dart
class Button {
  String label;
  String color;
  
  Button({required this.label, this.color = "Blue"}) {}
}
// Usage: Button(label: "Click", color: "Red")
```

### Pattern 4: Constructor with Logic
```dart
class Account {
  String accountType;
  double interestRate;
  
  Account(String type) {
    this.accountType = type;
    // Logic based on type
    if (type == "Savings") {
      this.interestRate = 0.05;
    } else {
      this.interestRate = 0.02;
    }
  }
}
```

### Pattern 5: Dart Shortcut (Field initialization)
```dart
class Person {
  String name;
  int age;
  
  // Shortcut: this.name = name automatically
  Person(this.name, this.age);
}
```

---

## Completing This Class

✅ Understand class design and object-oriented principles  
✅ Write classes with properties and methods  
✅ Understand constructors and initialization  
✅ Write multiple constructors (standard + named)  
✅ Understand named parameters in constructors (Flutter pattern!)  
✅ Create objects and access their properties/methods  
✅ Understand object state and persistence  

### What's Next?
Once you've completed all exercises:
- Review class concepts you found confusing
- Try the optional challenges to deepen understanding
- Compare with [solutions/solution_04.dart](solutions/solution_04.dart)
- **You're ready to start Flutter!** OOP fundamentals complete ✅

---

## Pro Tips for Class 04

- **Named parameters are ESSENTIAL for Flutter:** Every widget uses them!
- **Constructor shortcut:** `Person(this.name, this.age)` saves typing
- **Multiple constructors:** Use named constructors for flexibility
- **Validation in constructors:** Check parameter values before assigning
- **Methods represent actions:** `charge()`, `useApp()`, `getArea()` show what objects CAN DO

Congratulations! You've completed the Dart fundamentals curriculum! 🎉
