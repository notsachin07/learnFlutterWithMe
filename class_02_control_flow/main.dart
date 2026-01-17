// Class 02 - Source Code
// Run this using: dart main.dart

void main() {
  print("--- SECTION 1: Conditionals ---");
  int marks = 85;

  if (marks >= 90) {
    print("Grade: A+");
  } else if (marks >= 80) {
    print("Grade: A");
  } else if (marks >= 70) {
    print("Grade: B");
  } else {
    print("Grade: C (Needs Improvement)");
  }

  print("\n--- SECTION 2: The Switch Case ---");
  // Simulating a menu selection
  int choice = 2;
  
  switch (choice) {
    case 1:
      print("Selected: Pizza");
      break;
    case 2:
      print("Selected: Burger");
      break;
    case 3:
      print("Selected: Pasta");
      break;
    default:
      print("Invalid Selection");
  }

  print("\n--- SECTION 3: Loops ---");
  
  // Standard For Loop
  print("Counting down:");
  for (int i = 3; i > 0; i--) {
    print(i);
  }
  print("Liftoff!");

  // Iterating a List (Array)
  List<String> servers = ["AWS", "Azure", "Google Cloud"];
  print("\nCloud Providers:");
  
  for (var server in servers) {
    print("Connecting to $server...");
  }
  
  // While Loop
  print("\nWhile Loop Test:");
  int count = 0;
  while(count < 3) {
    print("Running process $count");
    count++;
  }
}