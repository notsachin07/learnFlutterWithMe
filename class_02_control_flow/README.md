# Class 02: Control Flow - Making Decisions & Repeating Actions

**Builds on:** Class 01 (Variables, Types, String Interpolation)

In Class 01, our code ran from top to bottom, line by line. In Class 02, we learn how to:
- **Make decisions** using conditionals (if your grade is 90+, print "A+")
- **Repeat actions** using loops (print counting from 1 to 100)
- **Control execution** with break/continue

## 🎯 Learning Objectives
- ✅ Master Conditional Logic (`if`, `else if`, `else`) for decision-making
- ✅ Learn `switch` statements for cleaner multi-choice logic
- ✅ Master `for` loops (counting, iterating lists)
- ✅ Master `while` and `do-while` loops for conditional repetition
- ✅ Understand `break` and `continue` for loop control
- ✅ Combine conditions with logical operators (`&&`, `||`, `!`)

## 📚 What You'll Learn

### Section 1: If/Else Conditionals
Make your program react to different situations:
```dart
if (marks >= 90) {
  print("Grade: A+");
} else if (marks >= 80) {
  print("Grade: A");
} else {
  print("Grade: B or lower");
}
```

### Section 2: Switch Statements
When a single variable has many options, use `switch` for cleaner code:
```dart
switch (choice) {
  case 1:
    print("Selected: Pizza");
    break;  // Important: don't forget break!
  case 2:
    print("Selected: Burger");
    break;
  default:
    print("Invalid choice");
}
```

### Section 3: For Loops
Repeat code a specific number of times:
```dart
// Count from 1 to 10
for (int i = 1; i <= 10; i++) {
  print("Number: $i");
}
```

### Section 4: For-In Loops
Iterate through items in a List (from Class 01):
```dart
List<String> students = ["Alex", "Jordan", "Sam"];
for (var student in students) {
  print("$student is here");
}
```

### Section 5: While Loops
Repeat until a condition becomes false:
```dart
int count = 0;
while (count < 3) {
  print("Count: $count");
  count++;  // Must increase, or infinite loop!
}
```

## 🔗 Prerequisites
- Class 01 complete (understand variables, types, string interpolation)

## 🧠 Key Differences from Python
If you are coming from Python:
1. **Indentation doesn't matter** for logic (only for readability)
2. You **must** use curly braces `{ }` to define blocks
3. Python's `elif` is written as `else if`
4. Use `&&` for "and", `||` for "or", `!` for "not"
5. Remember `break;` in switch statements!

## 📖 How to Use This Class

1. **Start with `main.dart`** — Run it and see 5 detailed examples
   ```bash
   dart main.dart
   ```

2. **Read the lesson modules:**
   - `01_conditionals.md` — if/else and switch statements
   - `02_loops.md` — for loops, while loops, and list iteration

3. **Try the exercises** in `exercises.md`:
   - FizzBuzz (classic programming challenge)
   - Odd or Even (conditionals practice)
   - Multiplication Table (loop practice)

4. **Check solutions** in `solutions/solution_02.dart`
   ```bash
   dart solutions/solution_02.dart
   ```

## 💡 Real-World Examples
- **Grading System:** Use if/else to assign letter grades
- **Menu System:** Use switch for user choices
- **Data Processing:** Use loops to process lists of data
- **Game Logic:** Control game flow with conditionals

## 🎯 Next Steps
Once you're comfortable with control flow, move to **Class 03: Functions** where you'll learn to organize code into reusable blocks.