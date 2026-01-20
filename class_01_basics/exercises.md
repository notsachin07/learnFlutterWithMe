# Class 01 Exercises - Test Your Fundamentals! 🚀

**Builds on:** Class 01 lessons (Variables, Types, String Interpolation)

Welcome to your first set of programming exercises! These are designed to test your understanding of Dart fundamentals. Remember: **Type the code yourself** (don't copy-paste). Mistakes are learning opportunities!

---

## Exercise 1: The Bio 👤

**Objective:** Create a program that stores personal information and displays it using multiple data types and string interpolation.

**Why This Exercise?**
This exercise tests whether you understand type declarations and how to combine different data types in a single output using string interpolation. These are the foundational skills for any Dart program.

### What You Need to Do:

Write a Dart program that stores the following information about yourself in variables with the **correct data types**:
- Your **Name** (must be a `String`)
- Your **Age** (must be an `int`)
- Your **Height in centimeters** (must be a `double`, e.g., 180.5)
- Whether you **like coding** (must be a `bool`: `true` or `false`)

Then use **String Interpolation** to print all this information in a professional single sentence using the `$variable` syntax.

### Example Output:
```
My name is Alex, I am 20 years old, 180.5cm tall, and it is true that I like coding.
```

### Key Concepts Tested:
- ✅ Declaring variables with explicit types (`String name = ...`)
- ✅ Using type inference with `var`
- ✅ String interpolation with `$variable` syntax
- ✅ Combining multiple data types in one output

### Hints:
- Start with explicit type declarations: `String name = "..."`, `int age = ...`, etc.
- All four variables must be declared in your program
- Use `$variable` for simple values and `${expression}` for calculations (if needed)
- Don't forget semicolons at the end of statements
- You can test type inference by replacing a few `var` keywords once the basic version works

### Steps to Solve:
1. Create a new file in the `solutions/` folder called `solution_01.dart`
2. Write the `void main() { }` function wrapper
3. Declare exactly four variables with your chosen data values
4. Use `print()` with string interpolation to display the sentence
5. Run it from terminal: `dart solutions/solution_01.dart`
6. Verify output matches the example format

### Challenge (Optional):
- Try declaring the same information using `var` instead of explicit types
- Store multiple people's information and print them all
- Calculate and display something (e.g., height in meters: `height / 100`)

---

## Exercise 2: The Swapper 🔄

**Objective:** Learn how to exchange values between variables without losing data.

**Why This Exercise?**
This teaches a critical programming concept: temporary storage. Many algorithms require swapping values, and understanding the "temp variable" pattern is essential for future learning.

### What You Need to Do:

You have two integer variables with different values. Your task is to **exchange their values** using a temporary variable:

1. Create two integer variables: `a = 10` and `b = 20`
2. **Before** swapping, print both variables (to show the starting state)
3. Perform the swap using a **temporary variable** (this is the key pattern!)
4. **After** swapping, print both variables again (to show the final state)
5. Result: `a` should equal 20, `b` should equal 10

### Example Output:
```
Before swapping:
a = 10
b = 20

After swapping:
a = 20
b = 10
```

### Key Concepts Tested:
- ✅ Understanding variable reassignment
- ✅ Using a temporary variable to preserve values
- ✅ Controlled variable manipulation
- ✅ Printing variables at different program states

### Hints:
- You'll need **three** integer variables total: `a`, `b`, and a temporary one (often called `temp`)
- Think of it like swapping two cups of water:
  1. Pour cup 1 into a third empty cup (temp saves the value)
  2. Pour cup 2 into cup 1 (b goes to a)
  3. Pour temp into cup 2 (original a value goes to b)
- The three-step pattern is: **Save → Move → Restore**

### Steps to Solve:
1. Declare `a = 10` and `b = 20`
2. Print their values with labels before swapping
3. Create a `temp` variable and perform these three operations:
   - `int temp = a;` (save a's value)
   - `a = b;` (move b to a)
   - `b = temp;` (restore a's original value to b)
4. Print their values again with labels after swapping
5. Run it: `dart solutions/solution_01.dart`

### Challenge (Optional):
- Can you swap with **different numbers** (try negative numbers, large numbers)?
- What happens if you forget the temp variable? (Try it and see the error!)
- Can you swap two `String` variables? Try: `"Hello"` and `"World"`

---

## Exercise 3: Type Detective 🔍

**Objective:** Understand Dart's type system and how to fix type-related errors.

**Why This Exercise?**
This teaches type safety—one of Dart's most powerful features. Understanding why type errors occur helps you write better, more maintainable code. This also prepares you for Flutter, where type safety prevents bugs.

### What You Need to Do:

Study the broken code below. Identify what's wrong with it, explain the error, and provide **three different ways** to fix it:

```dart
void main() {
  var message = "Hello";
  message = 123;  // ❌ This line causes an error!
  print(message);
}
```

### The Problem:
1. **Line 1:** `var message = "Hello"` tells Dart that `message` is a `String` (based on the assigned value)
2. **Line 2:** `message = 123` tries to assign an `int` to a variable that Dart expects to hold a `String`
3. **Result:** Compile error! Dart won't allow this.

### Key Concepts Tested:
- ✅ Understanding type inference with `var`
- ✅ Type consistency and Dart's type safety
- ✅ Alternative data types (`String`, `int`, `double`, `dynamic`)
- ✅ Fixing type mismatches

### Answer These Questions:
1. **What type is `message` after line 1?** (Hint: Look at what value is assigned)
2. **Why can't we assign `123` to it?** (What type is `123`?)
3. **What are all the ways we could fix this?** (Think creatively!)

### Example Solutions:

**Fix 1 - Change the type from the start (use `int`):**
```dart
void main() {
  var message = 123;  // Now it's inferred as int, not String
  print(message);
}
```

**Fix 2 - Use `dynamic` type (flexible, holds any type):**
```dart
void main() {
  dynamic message = "Hello";  // dynamic allows any type
  message = 123;  // Now this works!
  print(message);  // Prints: 123
}
```

**Fix 3 - Keep as String but assign String values:**
```dart
void main() {
  var message = "Hello";
  message = "123";  // Assign a String, not an int
  print(message);  // Prints: 123
}
```

**Fix 4 - Use explicit type declaration (even more type-safe):**
```dart
void main() {
  String message = "Hello";  // Explicitly declare as String
  message = "123";  // Must be String
  print(message);
}
```

### Your Task:
1. Understand why the original code fails
2. Write your own versions of each fix (don't just copy!)
3. Test each fix by running: `dart solutions/solution_01.dart`
4. Explain in a comment why each fix works

### Challenge (Optional - Advanced):
- Can you create a `dynamic` variable and assign it three different types in sequence? (String, int, bool)
- What happens if you try to do math on a `dynamic` that holds a String?
- Try to understand the difference between `var` and `dynamic` (both infer types, but differently!)

---

## How to Test Your Solutions

For each exercise:

1. **Create the file:** `solutions/solution_01.dart` in your class folder
2. **Type the code** carefully (no copy-pasting—typing helps memory!)
3. **Run it:** Open terminal in your class folder and type `dart solutions/solution_01.dart`
4. **Check output:** Does it match the expected output exactly?
5. **Debug if needed:** Error messages tell you what's wrong
6. **Try challenges:** Push yourself beyond the basic requirement

---

## Debugging Tips for Class 01

If you encounter errors, here's how to troubleshoot:

| Error | Cause | Solution |
|-------|-------|----------|
| `Expected an identifier` | Missing variable name or typo | Check spelling of variable names |
| `The value 'X' can't be assigned to a variable of type 'Y'` | Type mismatch (like in Exercise 3) | Check data types match |
| `Unexpected token 'X'` | Missing semicolon or bracket | Add `;` at end of statements |
| `'X' isn't a known variable` | Variable used before declaration | Declare the variable first |
| `Undefined name 'print'` | Misspelled `print()` | Check it's spelled exactly `print` |

---

## Completing This Class

✅ Understand when to use `String`, `int`, `double`, `bool`  
✅ Feel comfortable with string interpolation (`$variable` and `${expression}`)  
✅ Know how to declare, reassign, and swap variables  
✅ Recognize and fix type-related errors  

### What's Next?
Once you've completed all three exercises and understand the concepts:
- Review any exercises that confused you
- Try the optional challenges
- Check [solutions/solution_01.dart](solutions/solution_01.dart) to compare your code
- Move on to **Class 02: Control Flow** (if/else and loops)

---

## Pro Tips

- **Type everything yourself.** Copy-pasting bypasses muscle memory and understanding.
- **Read error messages carefully.** They're written to help you!
- **Test your assumptions.** Try to break your code—that's how you learn.
- **Comment your code.** Explain what each line does in your own words.
- **Compare your solution to others.** Different approaches can teach you new patterns.

Happy coding! 🎉

---

## Exercise 2: The Swapper 🔄

**Objective:** Learn how to exchange values between variables.

### What You Need to Do:

You have two variables with numbers. You need to swap their values:

1. Create two integer variables: `a = 10` and `b = 20`
2. Swap their values (a should become 20, b should become 10)
3. Print both variables before and after swapping

### Example Output:
```
Before swapping:
a = 10
b = 20

After swapping:
a = 20
b = 10
```

### Hints:
- You'll need a **temporary variable** to hold one value while you swap
- Think about it like this: If you want to swap two cups of water, you need a third empty cup to temporarily hold one of them
- There's a three-step process: save first value → move second value → restore first value

### Steps to Solve:
1. Declare `a` and `b` with their initial values
2. Print their values before swapping
3. Create a temporary variable (e.g., `temp`) to help with swapping
4. Do the swap using the temp variable
5. Print their values after swapping

---

## Exercise 3: Type Detective 🔍

**Objective:** Understand type safety and fix code errors.

### What You Need to Do:

Look at this code. It has a **bug**. Identify what's wrong and explain why, then fix it.

```dart
void main() {
  var message = "Hello";
  message = 123; 
  print(message);
}
```

### Questions to Answer:
1. **What type is `message` when it's first created?** (Hint: Look at what's assigned to it)
2. **What's wrong with the second line?** (Why can't we assign 123 to it?)
3. **How would you fix this code?** (There are multiple ways!)

### Example Solutions:

**Option 1:** Use explicit `var` only for numbers
```dart
var message = 123;  // Now it's an int, not a String
```

**Option 2:** Use `dynamic` if you really need to store different types
```dart
dynamic message = "Hello";
message = 123;  // This works with dynamic
```

**Option 3:** Don't change the type, only assign Strings
```dart
var message = "Hello";
message = "123";  // Still a String
```

### Challenge (Optional):
Can you fix the code in **three different ways** and explain each one?

---

## How to Test Your Solutions

For each exercise:

1. **Create the file:** `solution_01.dart`, `solution_02.dart`, etc.
2. **Type the code** carefully (mistakes are learning opportunities!)
3. **Run it:** Open terminal and type `dart solution_XX.dart`
4. **Check output:** Does it match the expected output?
5. **Debug if needed:** Look for error messages, they usually tell you what's wrong
6. **Try the challenge:** Go beyond the basic requirement

## Debugging Tips

If you get an error:
- **Read the error message carefully** - it tells you what's wrong
- **Check line numbers** - errors point to specific lines
- **Look for typos** - `Stirng` instead of `String`, missing semicolons
- **Verify variable names** - did you spell them the same way everywhere?
- **Check capitalization** - Dart cares about uppercase vs lowercase

## Ready to Check Your Work?

Once you've completed all three exercises, check [solutions/solution_01.dart](solutions/solution_01.dart) to see a working solution. Your code might look different—that's okay! As long as it works and follows the requirements, it's correct.

## What's Next?

✅ Completed this class? Great!
- Review concepts you found confusing
- Try modifying the exercises (e.g., use different numbers, different data)
- Explain your code to someone else
- Move on to **Class 02: Control Flow** (conditionals and loops)

---

**Remember:** Programming is about practice. The more you code, the better you get! 💪