// Solutions for Class 01 Exercises

void main() {
  // --- Solution 1: The Bio ---
  print("--- Exercise 1 ---");
  String name = "Sachin";
  int age = 19;
  double height = 175.5;
  bool likesCoding = true;

  print("My name is $name, I am $age years old, $height cm tall, and it is $likesCoding that I like coding.");


  // --- Solution 2: The Swapper ---
  print("\n--- Exercise 2 ---");
  int a = 10;
  int b = 20;
  
  print("Before Swap: a=$a, b=$b");

  // Logic to swap
  int temp = a;
  a = b;
  b = temp;

  print("After Swap: a=$a, b=$b");


  // --- Solution 3: Type Correction ---
  print("\n--- Exercise 3 ---");
  // The error in the question was assigning an int to a variable inferred as String.
  // Fix 1: Change the value to a String
  var message = "Hello";
  message = "123"; 
  print("Fixed using String: $message");

  // Fix 2: Use dynamic (if you really meant to change types)
  dynamic dynamicMessage = "Hello";
  dynamicMessage = 123;
  print("Fixed using dynamic: $dynamicMessage");
}