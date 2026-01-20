# Class 02 Exercises - Master Loops & Conditionals! 🔄

**Builds on:** Class 01 (Variables & Types), Class 02 lessons (Conditionals, Loops)

Now it's time to practice control flow! These exercises use `if/else` statements and loops to solve real-world problems. Remember: **test your code as you write it**, and debug errors carefully.

---

## Exercise 1: FizzBuzz (Classic Interview Question) 🐦

**Objective:** Use conditionals within a loop to print a pattern based on divisibility rules.

**Why This Exercise?**
FizzBuzz is asked in many programming interviews. It teaches you how to combine loops with multiple conditional checks—a pattern you'll use constantly. This exercise solidifies understanding of the modulo operator (`%`) and `else if` chains.

### What You Need to Do:

Write a program with a `for` loop that prints numbers from 1 to 20 **with special rules**:
- If the number is **divisible by 3**, print `"Fizz"` instead of the number
- If the number is **divisible by 5**, print `"Buzz"` instead of the number
- If the number is **divisible by both 3 AND 5**, print `"FizzBuzz"` instead of the number
- Otherwise, print the **number itself**

### Example Output:
```
1
2
Fizz
4
Buzz
Fizz
7
8
Fizz
Buzz
11
Fizz
13
14
FizzBuzz
16
17
Fizz
19
Buzz
```

### Key Concepts Tested:
- ✅ For loops with conditions
- ✅ Modulo operator (`%`) for divisibility checking
- ✅ Multiple conditional checks using `if`, `else if`, `else`
- ✅ Order of conditions matters! (Check divisibility by 15 first)

### Hints:
- Use `number % 3 == 0` to check if divisible by 3
- Check the **most specific condition first** (both 3 AND 5) before checking individual ones
- The structure should be: `if (divisible by 15) {...} else if (divisible by 3) {...} else if (divisible by 5) {...} else {...}`
- A number is divisible by both 3 and 5 if `number % 15 == 0`

### Steps to Solve:
1. Create `solutions/solution_02.dart`
2. Create a `for` loop: `for (int i = 1; i <= 20; i++)`
3. Inside the loop, write an `if/else if/else` chain checking divisibility
4. Print the appropriate value based on the conditions
5. Run it: `dart solutions/solution_02.dart`
6. Compare output with the example above

### Challenge (Optional):
- Extend to 100 instead of 20
- Create custom rules (e.g., "Foo" for 7, "Bar" for 11)
- Count how many "FizzBuzz"s appear in 1-100 (Hint: use a counter variable)

---

## Exercise 2: Odd or Even 🔢

**Objective:** Use a simple `if/else` statement to classify numbers as odd or even.

**Why This Exercise?**
This teaches the fundamental pattern of conditional branching. The modulo operator (`%`) is essential for remainder-based checks—critical for many algorithms. This exercise is often used as a first "classification" program.

### What You Need to Do:

Write a Dart program that:
1. Declares an integer variable `number` with any value (try: 15, 24, 42, 7, 100)
2. Uses an `if/else` statement to determine if the number is **even** or **odd**
3. Prints the result with the number (example: `"15 is Odd"`)

**Key Rule:** A number is **even** if `number % 2 == 0`, otherwise it's **odd**.

### Example Outputs:
```
If number = 15:
15 is Odd

If number = 24:
24 is Even

If number = 42:
42 is Even
```

### Key Concepts Tested:
- ✅ Simple if/else conditional logic
- ✅ Modulo operator (`%`) for remainder checking
- ✅ Understanding even/odd mathematical concept
- ✅ Single-condition branching

### Hints:
- Even numbers: `number % 2 == 0` (remainder is 0)
- Odd numbers: `number % 2 != 0` (remainder is 1 or doesn't exist)
- You can use either `else if` or just `else` (this case only has two branches)

### Steps to Solve:
1. Declare a variable: `int number = 15;` (or your chosen number)
2. Write an `if` condition: `if (number % 2 == 0)`
3. Print `"$number is Even"` if true
4. Print `"$number is Odd"` in the `else` block
5. Run it and test with multiple numbers
6. Test edge cases: negative numbers (-5, -10), zero (0), large numbers

### Challenge (Optional):
- Test with **multiple numbers** in the same program
- Create a loop that checks all numbers from 1-20
- Extend it: print "Even and divisible by 4" or "Odd and divisible by 3" (nested conditions)

---

## Exercise 3: The Multiplier (Multiplication Table) 📊

**Objective:** Use a loop to generate a multiplication table and format output.

**Why This Exercise?**
This exercise combines loops with string interpolation to produce formatted output. Nested loops (covered in Class 02 lesson) take this further—this builds that foundation.

### What You Need to Do:

Write a Dart program with a `for` loop that prints the **multiplication table for 5** (from 5×1 to 5×10):

1. Use a `for` loop that goes from 1 to 10
2. For each iteration, print the multiplication: `5 × i = result`
3. Calculate the result inside the loop using multiplication

### Example Output:
```
5 x 1 = 5
5 x 2 = 10
5 x 3 = 15
5 x 4 = 20
5 x 5 = 25
5 x 6 = 30
5 x 7 = 35
5 x 8 = 40
5 x 9 = 45
5 x 10 = 50
```

### Key Concepts Tested:
- ✅ For loops with counter variables
- ✅ Loop variable usage in calculations
- ✅ String interpolation with expressions: `${expression}`
- ✅ Formatting output consistently

### Hints:
- The loop structure: `for (int i = 1; i <= 10; i++)`
- Calculate inside the loop: `int result = 5 * i;`
- Use string interpolation: `print("5 x $i = ${5 * i}");`
- You can calculate directly or store in a variable first

### Steps to Solve:
1. Create a `for` loop starting at 1 and ending at 10
2. Inside the loop, calculate `5 * i`
3. Print the formatted line: `"5 x i = result"`
4. Run it: `dart solutions/solution_02.dart`
5. Verify output matches exactly

### Challenge (Optional):
- Make it a **generic multiplication table function** that takes a parameter
- Create a **nested loop** that prints multiplication tables for 1-10 (10×10 table!)
- Print a **formatted table** with aligned columns
- Calculate and print the **sum of all results** (1 + 2 + ... + 10 = 55, then × 5)

---

## Exercise 4: Pattern Printing 🎨

**Objective:** Use nested loops to create visual patterns (introduces nested loop concept).

**Why This Exercise?**
Nested loops are powerful for creating patterns, grids, and 2D structures. This exercise makes loop logic visible and tangible through pattern output.

### What You Need to Do:

Write a program that uses **nested loops** to print the following pattern:

```
*
**
***
****
*****
```

1. The outer loop controls **how many rows** (5 rows)
2. The inner loop controls **how many stars per row**
3. Row 1 has 1 star, Row 2 has 2 stars, etc.

### Example Output:
```
*
**
***
****
*****
```

### Key Concepts Tested:
- ✅ Nested loops (loop inside a loop)
- ✅ Outer loop variable used by inner loop
- ✅ Print statements with no newline vs. with newline
- ✅ Visual pattern generation

### Hints:
- Outer loop: `for (int row = 1; row <= 5; row++)`
- Inner loop: `for (int star = 1; star <= row; star++)` — notice `star <= row`!
- Inner loop prints: `print("*");` or use string multiplication: `print("*" * row);`
- After each row completes, you automatically get a new line

### Steps to Solve:
1. Create a nested loop structure
2. Outer loop iterates 5 times (rows 1-5)
3. Inner loop iterates based on outer loop counter
4. Each iteration of inner loop prints a `"*"`
5. Run it: `dart solutions/solution_02.dart`

### Challenge (Optional):
- Print an **inverted triangle** (5 stars down to 1)
- Print a **pyramid** (centered):
  ```
      *
     **
    ***
   ****
  *****
  ```
- Print a **rectangle** (5 rows, 8 stars per row)
- Print a **checkerboard** pattern with `*` and ` ` (space)

---

## How to Test Your Solutions

For each exercise:

1. **Create the file:** `solutions/solution_02.dart`
2. **Type the code** (builds better understanding than copy-pasting)
3. **Run it:** `dart solutions/solution_02.dart`
4. **Check output:** Compare exactly with the examples
5. **Debug:** Read error messages carefully
6. **Try challenges:** Extend beyond the basic requirements

---

## Common Loop Mistakes to Avoid

| Mistake | Problem | Fix |
|---------|---------|-----|
| Loop goes 0-19 instead of 1-20 | Off-by-one error | Check your loop range: `i <= 20` not `i < 20` |
| Infinite loop (program hangs) | Forget to increment `i` | Make sure you have `i++` in the loop |
| Conditions never true | Logic error | Test conditions with sample values |
| Using `=` instead of `==` | Assignment vs. comparison | Use `==` for comparison: `if (x == 5)` |
| Forgot semicolons or brackets | Syntax error | Add `;` at end of statements, `{}` for blocks |

---

## Completing This Class

✅ Understand and use `if`, `else if`, `else` statements  
✅ Use `for` loops to repeat code  
✅ Understand loop counters and loop control  
✅ Use modulo (`%`) to check divisibility  
✅ Combine loops and conditionals for complex logic  
✅ Create nested loops for patterns  

### What's Next?
Once you've completed all four exercises:
- Review any exercises that confused you
- Try the optional challenges to deepen understanding
- Check [solutions/solution_02.dart](solutions/solution_02.dart) to compare
- Move on to **Class 03: Functions** (reusable code blocks)

---

## Pro Tips for Class 02

- **Test with print statements:** Use `print("i = $i");` to debug loops
- **Trace through your logic:** Manually execute your loop with first few values
- **Off-by-one errors are common:** Always check first and last iteration
- **Nested loops are powerful:** Practice them until they feel natural
- **Comment your conditions:** Explain what each `if` checks

Happy looping! 🚀
