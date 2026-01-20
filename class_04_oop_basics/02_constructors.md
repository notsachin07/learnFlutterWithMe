# Lesson 4.2: Constructors

The Constructor is the function that runs **immediately** when you create an object. In Flutter, every Widget you type (like `Text()`, `Column()`, `Container()`) is actually a call to a constructor.

## 1. The Short Constructor (Dart Special)
In Java/C++, you have to write `this.x = x`. Dart has a shortcut.

```dart
class User {
  String name;
  int age;

  // The Constructor
  // It automatically assigns the argument to the property.
  User(this.name, this.age);
}

void main() {
  var u = User("Sachin", 19);
}
```
## 2. Named Constructors(The Flutter Way)
Sometimes a class needs multiple ways to be initialized. Dart allows named constructors using `Class.name`.
```dart
class Button {
  String title;
  bool isFlat;

  // Standard Constructor
  Button(this.title, this.isFlat);

  // Named Constructor for a "Flat" button
  Button.flat(String text) {
    title = text;
    isFlat = true;
  }
}

// Usage
var b1 = Button("Click Me", false);
var b2 = Button.flat("Submit");
```
## 3. Named Parameters in Constructors
This is exactly how Flutter widgets look.
```dart
class Screen {
  String title;
  int width;

  // Constructor with named parameters
  Screen({required this.title, this.width = 1080});
}

// Usage looks like Flutter!
var home = Screen(
  title: "Home Page",
  width: 1920,
);
```
---
