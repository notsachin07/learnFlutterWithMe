// Class 01 - Source Code
// Run this using: dart main.dart

void main() {
  // 1. Hello World
  print("--- SECTION 1: Hello World ---");
  print("Welcome to learnFlutterWithMe!");

  // 2. Variables and Types
  print("\n--- SECTION 2: Variables ---");
  
  // Explicit declaration
  String college = "VIT-AP"; 
  int year = 1;
  double gpa = 9.0;
  bool isLearning = true;

  // Type Inference (var)
  var os = "Linux"; // Dart knows this is a String
  
  // String Interpolation (Using variables inside strings)
  // We use $variableName to inject values.
  print("Student Info:");
  print("College: $college");
  print("Year: $year");
  print("OS Preference: $os");
  
  // 3. Simple Math
  print("\n--- SECTION 3: Simple Math ---");
  int a = 10;
  int b = 5;
  print("Sum of $a and $b is ${a + b}"); // Use ${} for expressions
}