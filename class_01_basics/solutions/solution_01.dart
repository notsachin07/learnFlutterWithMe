// Solutions for Class 01 Exercises
// Run this using: dart solutions/solution_01.dart

void main() {
  // --- Solution 1: The Bio ---
  print("--- Exercise 1: The Bio ---");
  String name = "Alex";
  int age = 20;
  double height = 180.5;
  bool likesCoding = true;

  print("My name is $name, I am $age years old, ${height}cm tall, and it is $likesCoding that I like coding.");


  // --- Solution 2: The Swapper ---
  print("\n--- Exercise 2: The Swapper ---");
  int a = 10;
  int b = 20;
  
  print("Before swapping:");
  print("a = $a");
  print("b = $b");

  // Logic to swap using a temporary variable
  int temp = a;  // Step 1: Save first value
  a = b;         // Step 2: Move second value to first
  b = temp;      // Step 3: Restore first value to second

  print("\nAfter swapping:");
  print("a = $a");
  print("b = $b");


  // --- Solution 3: Type Detective ---
  print("\n--- Exercise 3: Type Detective ---");
  // The original code had a bug: assigning an int (123) to a variable inferred as String.
  
  // Fix 1: Make message hold a number from the start
  print("\nFix 1 - Use int type:");
  var message1 = 123;  // Now it's an int
  print("message1 = $message1");

  // Fix 2: Use dynamic type (allows different types)
  print("\nFix 2 - Use dynamic type:");
  dynamic message2 = "Hello";
  message2 = 123;  // Now this works!
  print("message2 = $message2");

  // Fix 3: Keep as String but assign a String number
  print("\nFix 3 - Keep as String:");
  var message3 = "Hello";
  message3 = "123";  // Still a String, but it's "123" not 123
  print("message3 = $message3");
}