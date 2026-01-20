# Lesson 3.1: Function Structure & Arrow Syntax

**Builds on:** Class 01 (Variables, Types) & Class 02 (Control Flow)

Functions are reusable blocks of code. Instead of writing the same code 100 times, write it once in a function and call it 100 times!

## 🎯 What You'll Learn
- Understand function parts: name, parameters, return type
- Write standard function syntax
- Use arrow syntax (`=>`) for one-line functions
- Return values from functions
- Understand `void` (no return value)

## The Anatomy of a Function

```dart
// Return Type  Function Name  Parameters
     int          add           (int a, int b)  {
  // Function Body
  return a + b;
}
```

**Function Parts:**
1. **Return Type** (`int`, `void`, `String`, `double`, etc.) — What type of value the function returns
2. **Function Name** (`add`) — What you call to execute the function
3. **Parameters** (`int a, int b`) — Input data the function needs
4. **Function Body** `{ ... }` — The code that runs when you call the function

## 1. Standard Function Syntax

### Function That Returns a Value
```dart
// This function takes two integers and returns their sum
int add(int a, int b) {
  return a + b;
}

// Calling the function
int result = add(10, 20);
print(result);  // Output: 30
```

### Function With No Return Value (void)
```dart
// This function prints but doesn't return anything
void greet(String name) {
  print("Hello, $name!");
}

// Calling the function
greet("Alex");  // Output: Hello, Alex!
```

### Function With Multiple Statements
```dart
// Calculate area of a rectangle
double calculateArea(double width, double height) {
  if (width <= 0 || height <= 0) {
    print("Invalid dimensions!");
    return 0;
  }
  return width * height;
}

double area = calculateArea(10, 5);
print("Area: $area");  // Output: Area: 50.0
```

## 2. Arrow Syntax (`=>`)

If a function is just **one line** (one expression), you can use arrow syntax to make it shorter.

### Without Arrow Syntax (Standard)
```dart
int square(int number) {
  return number * number;
}
```

### With Arrow Syntax (Shorter)
```dart
int square(int number) => number * number;
```

Read `=>` as "returns".

### More Arrow Function Examples
```dart
// Calculate fahrenheit from celsius
double toFahrenheit(double c) => (c * 9 / 5) + 32;

// Check if a number is even
bool isEven(int n) => n % 2 == 0;

// Get absolute value
int absolute(int n) => n < 0 ? -n : n;

// Concatenate strings
String combine(String a, String b) => "$a $b";
```

### When to Use Arrow Syntax
- ✅ Simple calculations: `int double(int n) => n * 2;`
- ✅ Simple checks: `bool isEmpty(String s) => s.length == 0;`
- ✅ Simple transformations: `String upper(String s) => s.toUpperCase();`

- ❌ Don't use for complex logic:
  ```dart
  // Bad - too complex for arrow
  String process(String text) => text.split('').map(...).join(...);
  
  // Good - use standard syntax
  String process(String text) {
    var words = text.split('');
    // ... more logic
    return result;
  }
  ```

## 3. Function Parameters

Functions can take 0, 1, or multiple parameters.

### No Parameters
```dart
void sayHello() {
  print("Hello!");
}
```

### One Parameter
```dart
String greet(String name) {
  return "Welcome, $name!";
}
```

### Multiple Parameters
```dart
void createUser(String name, int age, String email) {
  print("User: $name, Age: $age, Email: $email");
}
```

## 4. Return Types

Functions must declare what type they return.

| Return Type | Means |
|-----------|-------|
| `void` | Returns nothing |
| `int` | Returns a whole number |
| `double` | Returns a decimal number |
| `String` | Returns text |
| `bool` | Returns true or false |
| `List` | Returns a list |

### Examples
```dart
// Returns nothing
void printGreeting() {
  print("Hi!");
}

// Returns an int
int multiply(int a, int b) {
  return a * b;
}

// Returns a String
String getName() {
  return "Alex";
}

// Returns a bool
bool isPositive(int n) {
  return n > 0;
}

// Returns a List
List<int> createNumbers() {
  return [1, 2, 3, 4, 5];
}
```

## 5. Real-World Examples

### Temperature Converter (with validation)
```dart
double toFahrenheit(double celsius) {
  if (celsius < -273.15) {
    print("Invalid temperature!");
    return 0;
  }
  return (celsius * 9 / 5) + 32;
}

double temp = toFahrenheit(25);
print("25°C = ${temp}°F");  // Output: 25°C = 77.0°F
```

### Check Student Grade
```dart
String getGrade(int score) {
  if (score >= 90) return "A+";
  if (score >= 80) return "A";
  if (score >= 70) return "B";
  return "C";
}

String grade = getGrade(85);
print("Your grade: $grade");  // Output: Your grade: A
```

## 🔄 Connection to Other Classes

- **Class 01 & 02:** Functions use variables, types, and conditionals
- **Lesson 3.2:** Named parameters (next lesson) make functions Flutter-compatible
- **Class 04:** Methods in classes are functions with this syntax
- **Flutter:** Every Flutter widget is a function with parameters!

---

**Next:** Learn about Parameters (Positional vs. Named) in Lesson 3.2