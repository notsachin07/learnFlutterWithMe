// Class 02 - Source Code
// Run this using: dart main.dart
// 
// Note: This class builds on Class 01 (variables, types, string interpolation).
// Now we learn to make decisions (if/else) and repeat actions (loops).
// After this, you'll be ready for Class 03 (Functions).

void main() {
  // ============================================
  // SECTION 1: If/Else Conditionals
  // ============================================
  // We use if/else to make decisions based on conditions.
  // From Class 01, remember: variables store values, types matter.
  print("--- SECTION 1: If/Else Conditionals ---");
  int marks = 85;
  
  // Use if/else if/else to check different conditions
  // Each condition is checked in order until one is true
  if (marks >= 90) {
    print("Grade: A+");
  } else if (marks >= 80) {
    print("Grade: A");
  } else if (marks >= 70) {
    print("Grade: B");
  } else {
    print("Grade: C (Needs Improvement)");
  }
  
  // Another example: checking properties (from Class 01)
  print("\nAge Check:");
  int age = 18;
  if (age >= 18) {
    print("You are an adult");
  } else {
    print("You are a minor");
  }

  // ============================================
  // SECTION 2: Switch Case Statements
  // ============================================
  // Switch is cleaner than multiple if/else for single value checks
  // Useful when one variable has many possible values
  print("\n--- SECTION 2: Switch Statements ---");
  
  // Simulating a menu selection (like in a game or app)
  int choice = 2;
  
  switch (choice) {
    case 1:
      print("Selected: Pizza");
      break;  // IMPORTANT: break stops the execution
    case 2:
      print("Selected: Burger");
      break;
    case 3:
      print("Selected: Pasta");
      break;
    default:
      print("Invalid Selection");
  }
  
  // Another example: day of week
  print("\nDay of Week:");
  int day = 5;
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 5:
      print("Friday");
      break;
    case 6:
    case 7:
      print("Weekend!");
      break;
    default:
      print("Invalid day");
  }

  // ============================================
  // SECTION 3: For Loops
  // ============================================
  // Loops let us repeat code multiple times automatically
  // For loops are useful when you know how many times to repeat
  print("\n--- SECTION 3: For Loops ---");
  
  // Standard For Loop (counting down)
  print("Counting down (3... 2... 1... Liftoff!):");
  for (int i = 3; i > 0; i--) {  // i-- means decrease i by 1 each time
    print(i);
  }
  print("Liftoff!");
  
  // For loop counting up
  print("\nMultiplication Table (3x table):");
  for (int i = 1; i <= 10; i++) {  // i++ means increase i by 1 each time
    int result = 3 * i;
    print("3 x $i = $result");
  }

  // ============================================
  // SECTION 4: For-In Loop (Iterating Lists)
  // ============================================
  // Use for-in when you want to go through each item in a List
  // From Class 01: Lists are groups of values
  print("\n--- SECTION 4: For-In Loops (Lists) ---");
  
  List<String> servers = ["AWS", "Azure", "Google Cloud"];
  print("Available Cloud Providers:");
  
  for (var server in servers) {
    print("• Connecting to $server...");
  }
  
  // Another example: list of students
  List<String> students = ["Alex", "Jordan", "Sam"];
  print("\nClass Roll Call:");
  for (var student in students) {
    print("$student is present");
  }

  // ============================================
  // SECTION 5: While Loops
  // ============================================
  // While loops repeat as long as a condition is true
  // Useful when you don't know how many times you'll loop
  print("\n--- SECTION 5: While Loops ---");
  
  int count = 0;
  print("Counting with while loop:");
  while (count < 3) {
    print("Count: $count");
    count++;  // Increase count each time (must increase, or infinite loop!)
  }
  
  // Another example: simulating a process
  print("\nSimulating battery drain:");
  int battery = 100;
  while (battery > 0) {
    if (battery == 100 || battery == 50 || battery == 1) {
      print("Battery: $battery%");
    }
    battery -= 25;  // Decrease by 25 each time
  }
}