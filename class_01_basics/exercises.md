# Class 01 Exercises

Now it's your turn! These exercises will test what you've learned about variables, data types, and string interpolation. **Type the code yourself** (don't copy-paste), and try to solve them without looking at the solutions.

## Exercise 1: The Bio 👤

**Objective:** Create a program that stores personal information and displays it.

### What You Need to Do:

Write a Dart program that stores the following information about yourself in variables with the **correct types**:
- Your Name (should be a String)
- Your Age (should be an int)
- Your Height in centimeters (should be a double, e.g., 180.5)
- Whether you like coding (should be a bool: true or false)

Then use **String Interpolation** to print all this information in a single sentence.

### Example Output:
```
My name is Alex, I am 20 years old, 180.5cm tall, and it is true that I like coding.
```

### Hints:
- Use appropriate data types (String for name, int for age, etc.)
- Use `${...}` when you need to combine calculations or multiple things
- Don't forget the semicolons at the end of statements

### Steps to Solve:
1. Create a new file called `solution_01.dart`
2. Write `void main() { }` function
3. Declare four variables with your info
4. Use `print()` with string interpolation to display the sentence
5. Run it: `dart solution_01.dart`

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