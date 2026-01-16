# Lesson 1.2: Variables and Data Types

Dart is a **statically typed** language, but it creates a balance by supporting **type inference**.

## Basic Types
Dart has several built-in types. Since everything in Dart is an Object (even numbers!), the default value is usually `null` if not initialized.

| Type | Description | Example |
| :--- | :--- | :--- |
| `int` | Integers (no decimals) | `10`, `-5` |
| `double` | Floating point numbers | `3.14`, `10.5` |
| `String` | Text | `"Hello"`, `'World'` |
| `bool` | Boolean | `true`, `false` |

## Declaration Styles

### 1. Explicit Typing (Safe & Clear)
Use this when you want to be strict about what data a variable holds.
```dart
int age = 20;
String name = "Sachin";
double height = 5.9;
bool isStudent = true;
var city = "Lucknow"; // Dart infers this is a String
// city = 10; // ERROR: You cannot assign an int to a String variable later.
dynamic weirdVariable = "I am text";
weirdVariable = 100; // This is allowed (but risky!)
