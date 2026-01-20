// Class 03 - Solutions for Exercises
// Run this using: dart solutions/solution_03.dart
// Builds on: Class 01 (Variables, Types), Class 02 (Loops, Conditionals), Class 03 lessons (Functions, Parameters)

void main() {
  // =========================================
  // EXERCISE 1: The Converter (Arrow Functions)
  // =========================================
  // Learning Goal: Understand arrow syntax (=>) for simple functions
  // Concepts: arrow functions, return types, parameter usage
  
  print("===== EXERCISE 1: Temperature Converter =====");
  
  // Test the converter with multiple temperatures
  print("Temperature Conversion Table:");
  List<double> temperatures = [0, 10, 25, 50, 100, -40];
  
  for (double celsius in temperatures) {
    double fahrenheit = toFahrenheit(celsius);
    print("${celsius}°C = ${fahrenheit.toStringAsFixed(1)}°F");
  }


  // =========================================
  // EXERCISE 2: The ID Card (Named Parameters)
  // =========================================
  // Learning Goal: Master named parameters—CRITICAL for Flutter!
  // Concepts: named parameters {}, required keyword, default values
  
  print("\n===== EXERCISE 2: ID Card (Named Parameters) =====");
  
  // Call 1: Using default role
  printIDCard(name: "Alex", age: 20);
  
  // Call 2: Override the role
  printIDCard(name: "Sarah", age: 22, role: "Teaching Assistant");
  
  // Call 3: Parameters in different order! (Try this with positional params—won't work!)
  printIDCard(role: "Instructor", age: 45, name: "Prof. Smith");
  
  // Call 4: Another with defaults
  printIDCard(name: "Jordan", age: 21);


  // =========================================
  // EXERCISE 3: Calculator Function
  // =========================================
  // Learning Goal: Combine functions with conditional logic (Class 02 + Class 03)
  // Concepts: multiple parameters, if/else chains, error handling, return types
  
  print("\n===== EXERCISE 3: Calculator Function =====");
  
  // Test all four operations
  print("Testing basic operations:");
  print("10 + 5 = ${calculate(10, 5, "add")}");
  print("10 - 5 = ${calculate(10, 5, "subtract")}");
  print("10 * 5 = ${calculate(10, 5, "multiply")}");
  print("10 / 5 = ${calculate(10, 5, "divide")}");
  
  // Test edge case: division by zero
  print("\nEdge case - division by zero:");
  print("10 / 0 = ${calculate(10, 0, "divide")}");
  
  // Test invalid operation
  print("\nInvalid operation:");
  print("10 ? 5 = ${calculate(10, 5, "power")}");
  
  // Use calculator in a real scenario (combining with loops from Class 02)
  print("\nUsing calculator in a loop:");
  for (int i = 1; i <= 5; i++) {
    double result = calculate(i.toDouble(), 5.0, "multiply");
    print("$i × 5 = ${result.toInt()}");
  }


  // =========================================
  // EXERCISE 4: BONUS - Temperature Conversions
  // =========================================
  // Learning Goal: Functions calling other functions (composition)
  // Concepts: function reuse, multiple functions working together
  
  print("\n===== EXERCISE 4 (BONUS): Multiple Conversions =====");
  
  // Use toFahrenheit and toKelvin to describe temperatures
  describe(0.0);     // Freezing point
  describe(25.0);    // Room temperature
  describe(100.0);   // Boiling point
  describe(-40.0);   // Interesting point where C = F


  // =========================================
  // KEY PATTERNS FROM THIS CLASS
  // =========================================
  print("\n===== KEY LEARNING PATTERNS =====");
  print("✓ Pattern 1: Arrow functions (=>) for simple one-liners");
  print("✓ Pattern 2: Named parameters make functions flexible");
  print("✓ Pattern 3: Default values reduce required parameters");
  print("✓ Pattern 4: Combine functions for complex logic");
  print("✓ Pattern 5: Functions enable code reuse");
}

// ============================================
// FUNCTION DEFINITIONS
// ============================================

// Exercise 1: Arrow Function - Temperature Converter
// Arrow syntax (=>) is perfect for simple, one-line functions
// Format: returnType functionName(parameters) => expression;
double toFahrenheit(double celsius) => (celsius * 9 / 5) + 32;

// Bonus: Reverse conversion
double toCelsius(double fahrenheit) => (fahrenheit - 32) * 5 / 9;

// Bonus: Convert to Kelvin
double toKelvin(double celsius) => celsius + 273.15;


// Exercise 2: Named Parameter Constructor (Flutter Pattern!)
// This is the EXACT pattern used in Flutter for every widget
// Named parameters go in {} brackets
// 'required' keyword means parameter MUST be provided
// Default value provides a fallback if parameter is omitted
void printIDCard({
  required String name,    // Must be provided (no default)
  required int age,        // Must be provided (no default)
  String role = "Student"  // Optional with default value
}) {
  print("========== ID CARD ==========");
  print("Name: $name");
  print("Age: $age");
  print("Role: $role");
  print("=============================\n");
}


// Exercise 3: Calculator Function with Conditional Logic
// Combines Class 02 (if/else) with Class 03 (functions)
// This pattern—function name as parameter—is used for flexibility
double calculate(double a, double b, String operation) {
  // IMPORTANT: Check most specific conditions first
  // In this case, all are equal priority, but convention matters
  
  if (operation == "add") {
    return a + b;
    
  } else if (operation == "subtract") {
    return a - b;
    
  } else if (operation == "multiply") {
    return a * b;
    
  } else if (operation == "divide") {
    // Edge case: prevent division by zero
    if (b == 0) {
      print("⚠️ Error: Cannot divide by zero!");
      return 0;  // Return a safe value or throw an error
    }
    return a / b;
    
  } else {
    // Unknown operation
    print("⚠️ Error: Unknown operation '$operation'");
    print("   Supported: add, subtract, multiply, divide");
    return 0;
  }
}


// Exercise 4 (Bonus): Multiple conversions - demonstrate function composition
// This function CALLS other functions (toFahrenheit, toKelvin, describe)
// It shows how functions can work together
void describe(double celsius) {
  // Call other functions to get converted values
  double fahrenheit = toFahrenheit(celsius);
  double kelvin = toKelvin(celsius);
  
  // Describe the temperature in natural language
  String description;
  if (celsius < 0) {
    description = "That's freezing!";
  } else if (celsius < 15) {
    description = "That's cold!";
  } else if (celsius < 25) {
    description = "That's pleasant!";
  } else if (celsius < 40) {
    description = "That's warm!";
  } else {
    description = "That's boiling!";
  }
  
  // Print results using both converted values and description
  print("${celsius}°C = ${fahrenheit.toStringAsFixed(1)}°F and ${kelvin.toStringAsFixed(2)}K. $description");
}