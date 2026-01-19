// Solutions for Class 03 Exercises

void main() {
  // --- Solution 1 ---
  print("--- Exercise 1: Converter ---");
  double tempC = 25.0;
  print("$tempC°C is ${toFahrenheit(tempC)}°F");

  // --- Solution 2 ---
  print("\n--- Exercise 2: ID Card ---");
  // Case A: Standard
  printIDCard(name: "Sachin", age: 19);
  
  // Case B: Changing the role
  printIDCard(name: "Professor X", age: 50, role: "Teacher");
  
  // Case C: Order swap
  printIDCard(role: "Admin", age: 30, name: "SysOp");

  // --- Solution 3 ---
  print("\n--- Exercise 3: Calculator ---");
  print("10 + 5 = ${calculate(10, 5, "add")}");
  print("10 - 5 = ${calculate(10, 5, "subtract")}");
}

// Solution 1: Arrow Syntax
double toFahrenheit(double c) => (c * 9 / 5) + 32;

// Solution 2: Named Parameters with Default Value
void printIDCard({required String name, required int age, String role = "Student"}) {
  print("Name: $name | Age: $age | Role: $role");
}

// Solution 3: Logic inside function
double calculate(double a, double b, String operation) {
  if (operation == "add") {
    return a + b;
  } else if (operation == "subtract") {
    return a - b;
  } else if (operation == "multiply") {
    return a * b;
  } else {
    print("Unknown operation");
    return 0;
  }
}