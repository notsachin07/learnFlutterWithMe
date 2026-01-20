# Class 03: Functions & Parameters - Reusable Code Blocks

**Builds on:** Class 01 (Variables, Types) & Class 02 (Control Flow)

Functions are reusable blocks of code. Instead of writing the same code 100 times, write it once and call it 100 times! In Flutter, you will use functions for everything: from building UI widgets to handling button clicks.

## 🎯 Learning Objectives
- ✅ Define and call functions with parameters
- ✅ Understand Return Types (`void`, `int`, `String`, `double`, etc.)
- ✅ Master **Arrow Syntax** (`=>`) for one-line functions
- ✅ **CRITICAL:** Understand **Named Parameters** (`{}`)
- ✅ Combine positional and named parameters
- ✅ Use default values for optional parameters
- ✅ Write functions with conditional logic (if/else from Class 02)

## 📚 What You'll Learn

### Section 1: Basic Functions
Write reusable code that can be called multiple times:
```dart
void greetUser(String name) {
  print("Welcome, $name!");
}

greetUser("Alex");     // Call with "Alex"
greetUser("Jordan");   // Call with "Jordan"
```

### Section 2: Arrow Functions (Short Syntax)
For one-line functions, use `=>` instead of `{ return ... }`:
```dart
int getSquare(int n) => n * n;
print(getSquare(5));  // Output: 25
```

### Section 3: Named Parameters (CRITICAL FOR FLUTTER!)
Use `{}` instead of `()` to require parameter names:
```dart
void describeDevice({required String brand, required int ram}) {
  print("$brand with $ram GB RAM");
}

// Must use parameter names:
describeDevice(brand: "Dell", ram: 16);
// Order doesn't matter:
describeDevice(ram: 8, brand: "Raspberry Pi");
```

### Section 4: Mixed Parameters
Combine positional (required order) and named (require names) parameters:
```dart
void uploadFile(String fileName, {required String destination}) {
  print("Uploading $fileName to $destination");
}

uploadFile("data.csv", destination: "/server/uploads");
```

### Section 5: Functions with Logic
Functions can contain if/else and loops from Class 02:
```dart
String calculateGrade(int score) {
  if (score >= 90) return "A+";
  if (score >= 80) return "A";
  return "B";
}
```

## 🔗 Prerequisites
- Class 01 complete (variables, types)
- Class 02 complete (if/else, loops)

## 🧠 Key Differences from Python
- **Def:** In Python, you use `def my_func():`. In Dart, you specify the return type: `void myFunc()`
- **Arrow:** Python has `lambda`. Dart has `=>`, but Dart's arrow functions are used everywhere, not just lambdas
- **Named Params:** Python doesn't have named parameters by default. Dart uses `{}` for this
- **Return:** Dart requires explicit return types (`void`, `int`, `String`, etc.)

## 📖 How to Use This Class

1. **Start with `main.dart`** — Run it and see 5+ function patterns with 12+ examples
   ```bash
   dart main.dart
   ```

2. **Read the lesson modules:**
   - `01_structure_and_syntax.md` — function basics and arrow syntax
   - `02_parameters.md` — positional, named, and mixed parameters

3. **Try the exercises** in `exercises.md`:
   - The Converter (arrow functions + math)
   - The ID Card (named parameters with defaults)
   - Calculator Function (logic inside functions)

4. **Check solutions** in `solutions/solution_03.dart`
   ```bash
   dart solutions/solution_03.dart
   ```

## ⚡ Real-World Examples
- **Temperature Converter:** Convert Celsius to Fahrenheit
- **ID Card Generator:** Create ID cards with optional fields
- **Calculator:** Perform different math operations
- **Data Validation:** Check if input meets requirements
- **Flutter Widgets:** Every widget is a function!

## ⭐ Why Named Parameters Matter for Flutter

In Flutter, you write code like this:
```dart
ElevatedButton(
  onPressed: handleClick,
  label: "Click me",
  style: ButtonStyle(...),
)
```

This is exactly the named parameter pattern you'll learn in this class! Understanding this now means Flutter will feel natural later.

## 🎯 Next Steps
Once you're comfortable with functions, move to **Class 04: OOP - Classes & Objects** where you'll combine functions with data into reusable blueprints.