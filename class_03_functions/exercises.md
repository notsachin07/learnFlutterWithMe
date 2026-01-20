# Class 03 Exercises - Master Functions! 🎯

**Builds on:** Class 01 (Variables, Types), Class 02 (Loops, Conditionals), Class 03 lessons (Functions, Parameters)

Functions are the building blocks of larger programs. These exercises teach you how to write reusable code, understand parameter types, and master named parameters—a critical concept for Flutter development.

---

## Exercise 1: The Converter (Arrow Functions) 🌡️

**Objective:** Write a simple function using arrow syntax to convert temperatures.

**Why This Exercise?**
Arrow functions are elegant shortcuts for single-expression functions. They appear throughout modern Dart and Flutter code. Learning arrow syntax early prepares you for production code patterns.

### What You Need to Do:

Write a **function named `toFahrenheit`** that:
1. Takes a `double` parameter representing degrees Celsius
2. Converts it to Fahrenheit using the formula: `(celsius * 9/5) + 32`
3. Returns the Fahrenheit value as a `double`
4. **Use arrow syntax:** `=> expression` instead of `{ return ... }`

### Example Output:
```
0°C = 32°F
25°C = 77°F
100°C = 212°F
-40°C = -40°F
```

### Key Concepts Tested:
- ✅ Arrow function syntax (=>)
- ✅ Function parameters and return types
- ✅ Math calculations in functions
- ✅ Calling functions with arguments

### Function Signature:
```dart
double toFahrenheit(double celsius) => (celsius * 9/5) + 32;
```

### Hints:
- Arrow functions use `=>` for one-line bodies
- No curly braces `{}` needed for arrow functions
- The return value is the result of the expression
- Test your function: `print("0°C = ${toFahrenheit(0)}°F");`

### Steps to Solve:
1. Create `solutions/solution_03.dart`
2. Write the arrow function `toFahrenheit`
3. In `main()`, call the function with several test values: 0, 25, 100, -40
4. Print results: `"${celsius}°C = ${toFahrenheit(celsius)}°F"`
5. Run it: `dart solutions/solution_03.dart`

### Challenge (Optional):
- Create `toCelsius` (reverse conversion)
- Create `toKelvin` function
- Chain conversions: Celsius → Fahrenheit → Celsius

---

## Exercise 2: The ID Card (Named Parameters) 🪪

**Objective:** Master named parameters by creating a function that prints formatted ID card information.

**Why This Exercise?**
Named parameters are CRITICAL for Flutter development. Flutter widgets use named parameters everywhere. This exercise makes you comfortable with `{parameter = defaultValue}` syntax before we move to constructors.

### What You Need to Do:

Write a **function named `printIDCard`** with these requirements:
1. Takes **named parameters** using `{ }` syntax (NOT positional)
2. `name` (String) — **required** (no default)
3. `age` (int) — **required** (no default)
4. `role` (String) — **optional** with default value `"Student"`
5. Print an ID card with all information

The function should format and print output like:
```
========== ID CARD ==========
Name: Alex
Age: 20
Role: Student
=============================
```

### Example Calls:
```dart
printIDCard(name: "Alex", age: 20);  // Uses default role
printIDCard(name: "Sarah", age: 22, role: "Teaching Assistant");
printIDCard(name: "Prof. Smith", age: 45, role: "Instructor");
```

### Key Concepts Tested:
- ✅ Named parameters with `{}`
- ✅ Required vs. optional parameters
- ✅ Default parameter values
- ✅ Function calls using named syntax

### Function Signature:
```dart
void printIDCard({required String name, required int age, String role = "Student"}) {
  // Your code here
}
```

### Hints:
- Use `{required String name}` for required parameters
- Use `{String role = "Student"}` for optional parameters with defaults
- Call with names: `printIDCard(name: "Alex", age: 20, role: "Manager")`
- You can call in any order with named parameters!

### Steps to Solve:
1. Declare the function with named parameters
2. Inside, use `print()` to format an ID card with all values
3. In `main()`, call the function 3+ times with different combinations:
   - With only required parameters (role uses default)
   - With all parameters specified
   - With parameters in different orders
4. Run it: `dart solutions/solution_03.dart`

### Challenge (Optional):
- Create `makeString` that returns the ID card as a String instead of printing
- Add more optional parameters: `email`, `department`, `employeeID`
- Create a `printResume` function using named parameters for multiple fields

---

## Exercise 3: Calculator Function 🧮

**Objective:** Write a function with conditional logic to perform different operations.

**Why This Exercise?**
This combines functions, parameters, and conditionals (from Class 02). It teaches you how to make functions flexible enough to handle multiple use cases—a critical skill for real-world programming.

### What You Need to Do:

Write a **function named `calculate`** that:
1. Takes three parameters:
   - `a` (double) — first number
   - `b` (double) — second number
   - `operation` (String) — which operation to perform
2. Returns a `double` with the result
3. Supports these operations:
   - `"add"` → return a + b
   - `"subtract"` → return a - b
   - `"multiply"` → return a * b
   - `"divide"` → return a / b (handle division by zero!)
4. For unknown operations, return 0 or print an error

### Example Usage:
```dart
print(calculate(10, 5, "add"));       // Output: 15
print(calculate(10, 5, "subtract"));  // Output: 5
print(calculate(10, 5, "multiply"));  // Output: 50
print(calculate(10, 5, "divide"));    // Output: 2
```

### Key Concepts Tested:
- ✅ Function parameters
- ✅ Return types
- ✅ If/else conditionals inside functions (from Class 02)
- ✅ Error handling (division by zero)
- ✅ String parameter matching

### Function Signature:
```dart
double calculate(double a, double b, String operation) {
  if (operation == "add") {
    return a + b;
  } else if (operation == "subtract") {
    return a - b;
  }
  // ... more operations ...
}
```

### Hints:
- Use `if` and `else if` chains to match the operation
- For division: check `if (b == 0)` before dividing
- Test your function with multiple operations
- What should happen if `operation` is "power" but you don't support it?

### Steps to Solve:
1. Write the `calculate` function
2. Handle all four operations: add, subtract, multiply, divide
3. In `main()`, test each operation with example values
4. Test edge case: divide by zero (what does your function do?)
5. Run it: `dart solutions/solution_03.dart`

### Challenge (Optional):
- Add "power" operation (use `pow()` from `dart:math`)
- Add "modulo" operation (remainder)
- Return a descriptive String: `"10 + 5 = 15"` instead of just the number
- Create a function factory: `getOperationResult(a, b, String op)` that calls `calculate`

---

## Exercise 4: Bonus - Temperature Conversions 🌡️

**Objective:** Write multiple related functions and combine them.

**Why This Exercise?**
This teaches function reusability and composition. Real programs are made of many small functions working together. This exercise shows that pattern.

### What You Need to Do:

Create three conversion functions:
1. `toFahrenheit(double celsius)` — Celsius to Fahrenheit (from Exercise 1, if not done)
2. `toKelvin(double celsius)` — Celsius to Kelvin (formula: `celsius + 273.15`)
3. `describe(double celsius)` — Describe temperature by calling other functions

The `describe` function should:
- Take temperature in Celsius
- Call `toFahrenheit()` and `toKelvin()`
- Print: `"25°C is 77°F and 298.15K. That's pleasant!"`

### Example Output:
```
0°C is 32°F and 273.15K. That's freezing!
25°C is 77°F and 298.15K. That's pleasant!
100°C is 212°F and 373.15K. That's boiling!
```

### Key Concepts Tested:
- ✅ Multiple functions working together
- ✅ Functions calling other functions
- ✅ Code reuse across functions
- ✅ Conditional logic for descriptions

### Steps to Solve:
1. Write `toFahrenheit` (arrow function, from Exercise 1)
2. Write `toKelvin` (arrow function)
3. Write `describe` that calls both conversion functions
4. In `main()`, call `describe` with different temperatures
5. Run it: `dart solutions/solution_03.dart`

### Challenge (Optional):
- Add more temperature descriptions ("freezing", "comfortable", "hot", "boiling")
- Create a `compareTemperatures(double temp1, double temp2)` function
- Create a function that converts ANY unit (Celsius → any of: Fahrenheit, Kelvin, Rankine)

---

## How to Test Your Solutions

For each exercise:

1. **Create the file:** `solutions/solution_03.dart`
2. **Type the code** (don't copy-paste)
3. **Run it:** `dart solutions/solution_03.dart`
4. **Check output:** Compare with examples
5. **Debug errors:** Read the message carefully
6. **Try challenges:** Push your understanding

---

## Function Patterns Reference

### Pattern 1: Arrow Functions (Simple)
```dart
int double(int x) => x * 2;
double toFahrenheit(double c) => (c * 9/5) + 32;
```

### Pattern 2: Positional Parameters
```dart
void greet(String name, int age) {
  print("$name is $age years old");
}
greet("Alex", 20);  // Order matters!
```

### Pattern 3: Named Parameters (Flutter Style!)
```dart
void printInfo({required String name, required int age, String role = "User"}) {
  print("$name, $age, $role");
}
printInfo(name: "Alex", age: 20);  // Order doesn't matter!
printInfo(age: 20, name: "Alex");  // Same as above!
```

### Pattern 4: Functions with Conditionals
```dart
String getGrade(int score) {
  if (score >= 90) return "A";
  else if (score >= 80) return "B";
  else return "C";
}
```

### Pattern 5: Functions Calling Functions
```dart
double celsius = 25;
double fahrenheit = toFahrenheit(celsius);
describe(celsius);  // Calls toFahrenheit internally
```

---

## Completing This Class

✅ Understand function declaration and syntax  
✅ Write arrow functions (`=>` syntax)  
✅ Use positional parameters  
✅ Use named parameters (CRITICAL for Flutter!)  
✅ Write functions that return values  
✅ Write functions with conditional logic  
✅ Understand function reusability  

### What's Next?
Once you've completed all exercises:
- Review functions you found confusing
- Try the optional challenges
- Compare with [solutions/solution_03.dart](solutions/solution_03.dart)
- Move on to **Class 04: OOP Classes** (objects and constructors)

---

## Pro Tips for Class 03

- **Named parameters are Flutter-essential:** Practice until they feel natural!
- **Arrow functions:** Use for simple one-liners, regular `{ }` for complex logic
- **Parameter order matters (positional) or not (named):** Test both!
- **Default values:** Make functions flexible without requiring all parameters
- **Test edge cases:** Division by zero, empty strings, negative numbers

Happy function writing! 🚀
