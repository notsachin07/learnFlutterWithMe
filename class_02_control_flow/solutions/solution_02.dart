// Solutions for Class 02 Exercises

void main() {
  // --- Solution 1: FizzBuzz ---
  print("--- Exercise 1: FizzBuzz ---");
  for (int i = 1; i <= 20; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz");
    } else if (i % 3 == 0) {
      print("Fizz");
    } else if (i % 5 == 0) {
      print("Buzz");
    } else {
      print(i);
    }
  }

  // --- Solution 2: Odd or Even ---
  print("\n--- Exercise 2: Odd or Even ---");
  int number = 7; // Change this to test other numbers
  
  if (number % 2 == 0) {
    print("$number is Even");
  } else {
    print("$number is Odd");
  }

  // --- Solution 3: The Multiplier ---
  print("\n--- Exercise 3: Multiplication Table ---");
  int tableOf = 5;
  
  for (int i = 1; i <= 10; i++) {
    int result = tableOf * i;
    print("$tableOf x $i = $result");
  }
}