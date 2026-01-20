# Lesson 4.2: Constructors - Initializing Objects Properly

**Builds on:** Lesson 4.1 (Classes & Objects) & Class 03 (Named Parameters)

The Constructor is a special function that runs **automatically** when you create an object. It's the perfect place to set up initial values. In Flutter, every widget (Button, Text, Container) is actually a constructor call!

## 🎯 What You'll Learn
- What constructors are and why they matter
- Write standard constructors
- Write named constructors (multiple creation methods)
- Use named parameters in constructors (Flutter style!)
- Understand `required` keyword
- Use default values in constructors

## 1. The Standard Constructor (Dart Shortcut)

In Java/C++, you have to write `this.x = x;` for each property. Dart has a shortcut!

### Without Constructor (Manual Assignment)
```dart
class User {
  String name;
  int age;
}

void main() {
  var user = User();
  // Have to set properties manually after creating
  user.name = "Alex";
  user.age = 22;
}
```

### With Constructor (Automatic Assignment)
```dart
class User {
  String name;
  int age;

  // Constructor: Automatically assigns parameters to properties
  User(this.name, this.age);
}

void main() {
  // Set properties at creation time!
  var user = User("Alex", 22);
}
```

Much cleaner! The `this.name` in the constructor parameter automatically assigns to the property.

### Real-World Example: Person Class
```dart
class Person {
  String firstName;
  String lastName;
  int age;
  String email;

  // Constructor
  Person(this.firstName, this.lastName, this.age, this.email);

  // Method to display info
  void printInfo() {
    print("$firstName $lastName, Age: $age");
    print("Email: $email");
  }
}

void main() {
  var person1 = Person("Alex", "Johnson", 25, "alex@example.com");
  person1.printInfo();
  
  var person2 = Person("Jordan", "Smith", 30, "jordan@example.com");
  person2.printInfo();
}
```

## 2. Named Constructors (Multiple Creation Methods)

Sometimes you need multiple ways to create an object. Use named constructors with the syntax `ClassName.constructorName`.

### Basic Example
```dart
class Button {
  String title;
  bool isFlat;

  // Standard Constructor
  Button(this.title, this.isFlat);

  // Named Constructor for a "flat" button (convenience method)
  Button.flat(String text) {
    title = text;
    isFlat = true;
  }

  // Named Constructor for a "raised" button
  Button.raised(String text) {
    title = text;
    isFlat = false;
  }
}

void main() {
  var btn1 = Button("Click Me", false);           // Standard
  var btn2 = Button.flat("Submit");               // Named: flat
  var btn3 = Button.raised("Cancel");             // Named: raised
}
```

### Real-World Example: Rectangle with Special Cases
```dart
class Rectangle {
  double width;
  double height;

  // Standard Constructor
  Rectangle(this.width, this.height);

  // Named Constructor: Create a square
  Rectangle.square(double size) {
    width = size;
    height = size;
  }

  // Named Constructor: Create from another rectangle (copy)
  Rectangle.copy(Rectangle other) {
    width = other.width;
    height = other.height;
  }

  double getArea() => width * height;
}

void main() {
  var rect = Rectangle(10, 5);
  print("Rectangle area: ${rect.getArea()}");      // 50

  var square = Rectangle.square(4);
  print("Square area: ${square.getArea()}");       // 16

  var copy = Rectangle.copy(rect);
  print("Copy area: ${copy.getArea()}");           // 50
}
```

## 3. Named Parameters in Constructors (FLUTTER STYLE!)

This is exactly how Flutter widgets work! Use `{}` with named parameters.

### Basic Example
```dart
class Screen {
  String title;
  int width;
  int height;

  // Constructor with Named Parameters
  Screen({
    required this.title,         // Must provide
    this.width = 1920,           // Optional, default 1920
    this.height = 1080,          // Optional, default 1080
  });
}

void main() {
  // Provide only required parameter
  var home = Screen(title: "Home");
  
  // Override defaults
  var custom = Screen(
    title: "Custom",
    width: 800,
    height: 600,
  );
}
```

### Real-World Example: TextWidget (Flutter Style!)
```dart
class TextWidget {
  String text;
  String color;
  int fontSize;

  // Constructor with Named Parameters (EXACTLY like Flutter!)
  TextWidget({
    required this.text,           // Must provide
    this.color = "Black",         // Optional, default Black
    this.fontSize = 14,           // Optional, default 14
  });

  void render() {
    print("Text: '$text' | Color: $color | Size: $fontSize");
  }
}

void main() {
  // Create with just required param
  var header = TextWidget(text: "Welcome");
  header.render();
  
  // Customize colors and size
  var title = TextWidget(
    text: "My App",
    color: "Blue",
    fontSize: 24,
  );
  title.render();
  
  // Mix order - doesn't matter!
  var body = TextWidget(
    fontSize: 16,
    text: "This is body text",
    color: "Gray",
  );
  body.render();
}
```

## 4. Constructor with Logic

Constructors can contain conditional logic or validation!

```dart
class Smartphone {
  String brand;
  int storage;
  int battery = 100;  // Always starts at 100

  Smartphone(this.brand, this.storage) {
    // Validate storage
    if (storage < 64) {
      print("Warning: Storage is less than 64GB");
    }
  }

  void info() {
    print("$brand - $storage GB");
  }
}

void main() {
  var phone1 = Smartphone("iPhone", 128);    // OK
  var phone2 = Smartphone("Budget Phone", 32);  // Warning!
}
```

### Constructor with Complex Initialization
```dart
class User {
  String username;
  String email;
  String role;
  bool isActive;

  User({
    required this.username,
    required this.email,
    String? inputRole,
    bool? inputActive,
  }) {
    // Set role based on input or username
    if (inputRole != null) {
      role = inputRole;
    } else {
      role = username.contains("admin") ? "admin" : "user";
    }
    
    // Set active status
    isActive = inputActive ?? true;  // Default to true if null
  }

  void displayInfo() {
    print("User: $username");
    print("Email: $email");
    print("Role: $role");
    print("Active: $isActive");
  }
}

void main() {
  var user1 = User(username: "admin_user", email: "admin@example.com");
  user1.displayInfo();
  
  var user2 = User(
    username: "regular_user",
    email: "user@example.com",
    inputRole: "moderator",
  );
  user2.displayInfo();
}
```

## 5. Constructor Comparison

| Type | When to Use | Example |
|------|-----------|---------|
| Standard | Basic initialization | `Person(name, age)` |
| Named | Multiple creation methods | `Rectangle.square(4)` |
| Named Params | Flutter style, optional params | `TextWidget(text: "Hi", color: "Blue")` |

## ⭐ Why Constructors Matter for Flutter

In Flutter, you write:
```dart
// Flutter code
Column(
  children: [
    Text("Hello"),
    Button(onPressed: handleClick, label: "Click"),
  ],
)
```

This is calling:
- `Column()` constructor with named parameter `children:`
- `Text()` constructor with positional parameter "Hello"
- `Button()` constructor with named parameters `onPressed:` and `label:`

Constructors with named parameters are **EVERYWHERE** in Flutter!

## 🔄 Connection to Other Classes

- **Class 04, Lesson 4.1:** Objects are created from classes (this lesson is how!)
- **Class 03, Lesson 3.2:** Named parameters (from functions) are used here too
- **Flutter:** Every widget instantiation is a constructor call with named parameters

---

**Congratulations!** You've now learned all four foundational classes. You're ready to start building with Flutter!