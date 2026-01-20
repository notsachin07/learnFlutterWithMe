# Lesson 2.1: Conditionals - Making Decisions in Your Code

**Builds on:** Class 01 (Variables, Types, String Interpolation)

Conditionals let your code make decisions. Instead of doing the same thing every time, conditionals check a condition and execute different code based on the result.

## 🎯 What You'll Learn
- Use `if` to check if something is true
- Use `else if` to check multiple conditions
- Use `else` as a fallback
- Use `switch` for cleaner multi-choice logic
- Understand boolean logic operators (`&&`, `||`, `!`)

## If / Else

This allows your code to branch based on conditions (boolean values: true or false).

### Basic If Statement
```dart
int age = 20;

if (age >= 18) {
  print("You are an adult.");
}
```

The code inside `{}` runs **only if** the condition is true.

### If/Else If/Else Chain
Check multiple conditions in order. The first true condition runs, then the rest are skipped.

```dart
int age = 20;

if (age >= 18) {
  print("You are an adult.");
} else if (age > 12) {
  print("You are a teenager.");
} else {
  print("You are a child.");
}
```

**Important:** The conditions are checked from top to bottom. Once one is true, the others are skipped!

### Real-World Example: Grading System (from Class 01)
```dart
int marks = 85;

if (marks >= 90) {
  print("Grade: A+");
} else if (marks >= 80) {
  print("Grade: A");
} else if (marks >= 70) {
  print("Grade: B");
} else {
  print("Grade: C");
}
```

## Logical Operators

Combine conditions with `&&` (AND), `||` (OR), and `!` (NOT).

```dart
int age = 20;
bool hasLicense = true;

// AND: both must be true
if (age >= 18 && hasLicense) {
  print("You can drive!");
}

// OR: at least one must be true
if (age < 13 || age > 65) {
  print("Special pricing applies!");
}

// NOT: reverses true/false
if (!hasLicense) {
  print("You need a license!");
}
```

## Switch Statement

When checking a single variable for many possible values, `switch` is cleaner than multiple `if/else if` statements.

```dart
String command = "OPEN";

switch (command) {
  case "OPEN":
    print("Opening the door...");
    break; // IMPORTANT: prevents fall-through!
  case "CLOSE":
    print("Closing the door...");
    break;
  case "LOCK":
    print("Locking the door...");
    break;
  default:
    print("Unknown command.");
}
```

### Key Points:
- Each `case` checks if it matches the variable
- `break;` exits the switch (don't forget it!)
- `default` is like `else` - runs if no cases match

### Real-World Example: Menu Selection
```dart
int choice = 2;

switch (choice) {
  case 1:
    print("You selected Pizza");
    break;
  case 2:
    print("You selected Burger");
    break;
  case 3:
    print("You selected Pasta");
    break;
  default:
    print("Invalid selection");
}
```

## 💡 When to Use What

- **Single condition?** Use `if/else`
  ```dart
  if (age >= 18) { ... } else { ... }
  ```

- **Multiple conditions on same variable?** Use `switch`
  ```dart
  switch (day) { case 1: ...; case 2: ...; }
  ```

- **Complex logic?** Use `if/else if`
  ```dart
  if (score > 90) { ... } else if (score > 80) { ... }
  ```

## 🔄 Connection to Other Classes

- **Class 01:** Conditionals use variables and types you learned in Class 01
- **Class 02 (next lesson):** Loops often contain conditionals inside them
- **Class 03:** Functions can contain conditionals to make decisions
- **Class 04:** Class methods (functions in classes) use conditionals for logic

---

**Next:** Learn about Loops (repetition) in Lesson 2.2