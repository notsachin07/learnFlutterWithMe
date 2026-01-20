// Class 01 - Solutions for Exercises
// Run this using: dart solutions/solution_01.dart
// Builds on: Class 01 lessons (Variables, Types, String Interpolation)

void main() {
  // ========================================
  // SECTION 1: Exercise 1 - The Bio
  // ========================================
  // Learning Goal: Understand different data types and string interpolation
  // This exercise tests: explicit type declarations, type inference, string interpolation
  
  print("===== EXERCISE 1: The Bio =====");
  
  // Step 1: Declare variables with explicit types
  // Using explicit types makes your code clearer and helps Dart catch errors
  String name = "Alex";           // Text data
  int age = 20;                   // Whole numbers only
  double height = 180.5;          // Numbers with decimals
  bool likesCoding = true;        // true or false
  
  // Step 2: Use string interpolation to combine all data in one output
  // Notice: $variable for simple values, ${expression} for complex expressions
  print("My name is $name, I am $age years old, ${height}cm tall, and it is $likesCoding that I like coding.");
  
  // Challenge variant: Using type inference (var keyword)
  // Dart figures out the type from what you assign
  print("\nVariant using 'var' keyword (type inference):");
  var name2 = "Jordan";
  var age2 = 22;
  var height2 = 175.3;
  var likesCoding2 = true;
  print("My name is $name2, I am $age2 years old, ${height2}cm tall, and it is $likesCoding2 that I like coding.");

  
  // ========================================
  // SECTION 2: Exercise 2 - The Swapper
  // ========================================
  // Learning Goal: Understand variable reassignment and temporary storage
  // This exercise tests: variable manipulation, temporary variables, state tracking
  
  print("\n===== EXERCISE 2: The Swapper =====");
  
  // Initial values
  int a = 10;
  int b = 20;
  
  // Show initial state (before swap)
  print("Before swapping:");
  print("a = $a");
  print("b = $b");
  
  // The Swap Algorithm using a temporary variable:
  // This is one of the most important patterns in programming!
  // We need 3 steps because if we just do a = b; b = a; we lose the original a value
  
  int temp = a;  // STEP 1: Save the first value (a = 10) in temp
  a = b;         // STEP 2: Move the second value (b = 20) to the first (a = 20)
  b = temp;      // STEP 3: Restore the first value (temp = 10) to the second (b = 10)
  
  // Show final state (after swap)
  print("\nAfter swapping:");
  print("a = $a");
  print("b = $b");
  
  // Extended example: Swap with different values
  print("\nExtra Example - Swapping different numbers:");
  int x = 100;
  int y = 5;
  print("Before: x = $x, y = $y");
  
  int tempXY = x;
  x = y;
  y = tempXY;
  
  print("After: x = $x, y = $y");


  // ========================================
  // SECTION 3: Exercise 3 - Type Detective (All Fixes)
  // ========================================
  // Learning Goal: Understand Dart's type system and type safety
  // This exercise tests: type inference, type consistency, fixing type errors
  
  print("\n===== EXERCISE 3: Type Detective =====");
  print("Problem: Original code tries to assign int (123) to a String variable");
  print("var message = \"Hello\";  // Inferred as String");
  print("message = 123;           // ERROR! Can't assign int to String\n");
  
  // FIX 1: Change initial value to int
  print("--- FIX 1: Use int type from start ---");
  var message1 = 123;  // Dart infers this as int, not String
  print("var message1 = 123;");
  print("message1 = $message1 (type: int)");
  
  // FIX 2: Use dynamic type (can hold any type)
  print("\n--- FIX 2: Use dynamic type (flexible) ---");
  dynamic message2 = "Hello";  // Start as String
  message2 = 123;              // Can change to int because it's dynamic
  print("dynamic message2 = \"Hello\"; message2 = 123;");
  print("message2 = $message2 (type: dynamic, but holds int)");
  
  // FIX 3: Keep as String but assign String values
  print("\n--- FIX 3: Consistent String type ---");
  var message3 = "Hello";
  message3 = "123";  // Assign a String "123", not int 123
  print("var message3 = \"Hello\"; message3 = \"123\";");
  print("message3 = $message3 (type: String)");
  
  // FIX 4: Use explicit type declaration
  print("\n--- FIX 4: Explicit type declaration (most type-safe) ---");
  String message4 = "Hello";
  message4 = "456";  // Must be String (compiler enforces it!)
  print("String message4 = \"Hello\"; message4 = \"456\";");
  print("message4 = $message4 (type: String, enforced)");
  
  // Key Learning: Type Safety
  print("\n*** KEY INSIGHT: Dart is TYPE-SAFE ***");
  print("- var: Infers type from first assignment (can't change)");
  print("- dynamic: Accepts any type (more flexible, less safe)");
  print("- Explicit types: Best for clarity and catching errors early");
}