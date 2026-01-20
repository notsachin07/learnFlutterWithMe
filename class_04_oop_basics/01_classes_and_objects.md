# Lesson 4.1: Classes & Objects - The Blueprint Pattern

**Builds on:** Class 01 (Variables, Types), Class 02 (Control Flow), Class 03 (Functions)

A **Class** is a blueprint for creating objects. An **Object** is a specific instance created from that blueprint.

## 🎯 What You'll Learn
- Understand the difference between classes and objects
- Define properties (variables in a class)
- Define methods (functions in a class)
- Create objects from classes
- Access and modify object properties
- Call object methods

## The Blueprint Metaphor

Think of a class like a cookie cutter and objects like actual cookies:

```
Class (Cookie Cutter)  →  Object (Actual Cookie)
            ↓
        Blueprint          Instance
        Template           Real thing
```

## Defining a Class

Classes use **PascalCase** (capitalize first letter).

```dart
class Robot {
  // Properties (Variables inside the class)
  String name = "Droid";
  int batteryLevel = 100;

  // Methods (Functions inside the class)
  void sayHello() {
    print("Beep boop. I am $name.");
  }
  
  void useBattery() {
    batteryLevel -= 10;
    print("Battery is now $batteryLevel%");
  }
}
```

### Class Parts:
- **Properties:** Variables that belong to the object
- **Methods:** Functions that belong to the object

## Creating Objects (Instances)

Once you have a class, create objects from it:

```dart
void main() {
  // Create an Object (Instance) from the Robot class
  var myBot = Robot();
  
  // Create another object - separate from myBot!
  var anotherBot = Robot();
}
```

## Accessing and Modifying Properties

Use the dot `.` operator to access properties:

```dart
void main() {
  var myBot = Robot();
  
  // Read property
  print(myBot.name);        // Output: Droid
  
  // Modify property
  myBot.name = "R2-D2";
  print(myBot.name);        // Output: R2-D2
  
  // Access numeric property
  print(myBot.batteryLevel);  // Output: 100
}
```

## Calling Methods

Use the dot `.` operator to call methods:

```dart
void main() {
  var myBot = Robot();
  
  // Call a method
  myBot.sayHello();          // Output: Beep boop. I am Droid.
  
  // Modify name first
  myBot.name = "C-3PO";
  myBot.sayHello();          // Output: Beep boop. I am C-3PO.
  
  // Call method that changes state
  myBot.useBattery();        // Output: Battery is now 90%
}
```

## Real-World Example: Student Class

```dart
class Student {
  // Properties
  String name;
  String major;
  double gpa;
  
  // Method: Display student info
  void displayInfo() {
    print("Name: $name");
    print("Major: $major");
    print("GPA: $gpa");
  }
  
  // Method: Improve GPA
  void studyHard() {
    if (gpa < 4.0) {
      gpa += 0.1;
    }
    print("$name is studying! GPA now: $gpa");
  }
}

void main() {
  // Create two students (two different objects)
  var student1 = Student();
  student1.name = "Alex";
  student1.major = "Computer Science";
  student1.gpa = 3.5;
  
  var student2 = Student();
  student2.name = "Jordan";
  student2.major = "Mathematics";
  student2.gpa = 3.8;
  
  // Each object is independent!
  student1.displayInfo();    // Shows Alex's info
  student2.displayInfo();    // Shows Jordan's info
  
  student1.studyHard();      // Only affects student1
  student1.displayInfo();    // Alex's GPA increased
}
```

## Key Concepts

### 1. Objects Are Independent
```dart
var phone1 = Robot();
var phone2 = Robot();

phone1.name = "Phone1";
phone2.name = "Phone2";

print(phone1.name);  // Output: Phone1
print(phone2.name);  // Output: Phone2
```

Each object has its own properties!

### 2. Methods Can Modify Properties
```dart
class Counter {
  int count = 0;
  
  void increment() {
    count++;
  }
  
  void show() {
    print("Count: $count");
  }
}

var counter = Counter();
counter.show();         // Output: Count: 0
counter.increment();
counter.show();         // Output: Count: 1
counter.increment();
counter.show();         // Output: Count: 2
```

### 3. Methods Can Return Values
```dart
class Calculator {
  int add(int a, int b) {
    return a + b;
  }
  
  int multiply(int a, int b) {
    return a * b;
  }
}

var calc = Calculator();
print(calc.add(5, 3));      // Output: 8
print(calc.multiply(5, 3)); // Output: 15
```

## Naming Conventions

| What | Convention | Example |
|------|-----------|---------|
| Class name | PascalCase | `class Student` |
| Property name | camelCase | `String firstName` |
| Method name | camelCase | `void displayInfo()` |
| Variable name | camelCase | `var myStudent` |

## 🔄 Connection to Other Classes

- **Class 01-03:** Classes use variables, conditionals, loops, and functions
- **Lesson 4.2:** Constructors (next lesson) - initialize objects when creating them
- **Flutter:** Every widget (Button, Text, Container) is a class with properties and methods

---

**Next:** Learn about Constructors in Lesson 4.2 - How to initialize objects properly