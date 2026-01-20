// Class 02 - Solutions for Exercises
// Run this using: dart solutions/solution_02.dart
// Builds on: Class 01 (Variables & Types), Class 02 lessons (Conditionals, Loops)

import 'dart:io';

void main() {
  // =========================================
  // EXERCISE 1: FizzBuzz (Classic Interview Question)
  // =========================================
  // Learning Goal: Combine loops with multiple conditions
  // Concepts: for loops, if/else if chains, modulo operator (%), logical AND (&&)
  
  print("===== EXERCISE 1: FizzBuzz =====");
  
  // The algorithm:
  // 1. Loop from 1 to 20
  // 2. Check divisibility in SPECIFIC order (most specific first!)
  // 3. If divisible by both 3 AND 5 → print "FizzBuzz"
  // 4. Else if divisible by 3 → print "Fizz"
  // 5. Else if divisible by 5 → print "Buzz"
  // 6. Else → print the number
  
  for (int i = 1; i <= 20; i++) {
    // IMPORTANT: Check the most specific condition (divisible by 15) FIRST!
    // If we checked i % 3 == 0 first, we'd print "Fizz" for 15, missing "FizzBuzz"
    if (i % 15 == 0) {
      // 15, 30, 45... are divisible by both 3 and 5
      print("FizzBuzz");
    } else if (i % 3 == 0) {
      // 3, 6, 9, 12, 18... divisible by 3 only
      print("Fizz");
    } else if (i % 5 == 0) {
      // 5, 10, 20... divisible by 5 only
      print("Buzz");
    } else {
      // All other numbers
      print(i);
    }
  }


  // =========================================
  // EXERCISE 2: Odd or Even
  // =========================================
  // Learning Goal: Simple binary conditional logic
  // Concepts: if/else, modulo operator (%), variable testing
  
  print("\n===== EXERCISE 2: Odd or Even =====");
  
  // Test with one number
  int number = 15;
  print("Testing number: $number");
  
  if (number % 2 == 0) {
    print("$number is Even");
  } else {
    print("$number is Odd");
  }
  
  // Bonus: Test with multiple numbers using a loop
  print("\nBonus - Testing numbers 1-10:");
  for (int n = 1; n <= 10; n++) {
    if (n % 2 == 0) {
      print("$n is Even");
    } else {
      print("$n is Odd");
    }
  }


  // =========================================
  // EXERCISE 3: The Multiplier (Multiplication Table)
  // =========================================
  // Learning Goal: Use loops to generate formatted output
  // Concepts: for loops, counter variables, calculations, string interpolation
  
  print("\n===== EXERCISE 3: Multiplication Table =====");
  
  int tableOf = 5;  // Generate 5× table
  print("Multiplication Table of $tableOf:");
  
  for (int i = 1; i <= 10; i++) {
    // Method 1: Calculate inside the print statement
    print("$tableOf x $i = ${tableOf * i}");
    
    // OR Method 2: Store in variable first (shown in next example)
  }
  
  // Extra: Do the same for table of 7
  print("\nMultiplication Table of 7:");
  for (int i = 1; i <= 10; i++) {
    int result = 7 * i;  // Store result in variable
    print("7 x $i = $result");
  }


  // =========================================
  // EXERCISE 4: Pattern Printing (Nested Loops)
  // =========================================
  // Learning Goal: Understand nested loops for 2D patterns
  // Concepts: nested loops, outer loop variable used in inner loop, pattern generation
  
  print("\n===== EXERCISE 4: Pattern Printing =====");
  
  print("\nTriangle Pattern (5 rows):");
  // Outer loop: controls number of rows (1 to 5)
  for (int row = 1; row <= 5; row++) {
    // Inner loop: controls stars per row (1 to row)
    // KEY INSIGHT: Inner loop goes UP TO the outer loop variable (row)
    for (int star = 1; star <= row; star++) {
      stdout.write("*");  // Write star without newline
    }
    print("");  // Newline after each row
  }
  
  // Alternative method: Using string repetition (newer Dart feature)
  print("\nTriangle Pattern - Alternative Method:");
  for (int row = 1; row <= 5; row++) {
    // Dart can repeat strings: "*" * 3 = "***"
    String starRow = "*" * row;  // Create row of stars
    print(starRow);
  }
  
  // Bonus: Inverted Triangle
  print("\nInverted Triangle Pattern:");
  for (int row = 5; row >= 1; row--) {
    print("*" * row);
  }
  
  // Bonus: Rectangle Pattern (3 rows × 5 columns)
  print("\nRectangle Pattern (3 rows × 5 columns):");
  for (int row = 1; row <= 3; row++) {
    for (int col = 1; col <= 5; col++) {
      stdout.write("*");
    }
    print("");  // Newline after each row
  }
  
  // Bonus: Multiplication Grid (nested loop with calculation)
  print("\nMultiplication Grid (4×4):");
  for (int row = 1; row <= 4; row++) {
    String line = "";
    for (int col = 1; col <= 4; col++) {
      int product = row * col;
      // Add spacing for alignment
      line = "$line ${product.toString().padLeft(2)}";
    }
    print(line);
  }


  // =========================================
  // KEY PATTERNS FROM THIS CLASS
  // =========================================
  print("\n===== KEY LEARNING PATTERNS =====");
  print("✓ Pattern 1: If/Else chains check conditions in order");
  print("✓ Pattern 2: Modulo (%) is used for divisibility checks");
  print("✓ Pattern 3: For loops repeat code a set number of times");
  print("✓ Pattern 4: Nested loops create 2D patterns");
  print("✓ Pattern 5: Loop variables can be used in calculations");
}