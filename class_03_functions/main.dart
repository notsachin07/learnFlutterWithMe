// Class 03 - Source Code
// Run this using: dart main.dart
//
// Note: This class builds on Class 01 (variables, types) and Class 02 (control flow).
// Functions let us reuse code and organize programs.
// Named Parameters (learned here) are CRITICAL for Flutter.

void main() {
  // ============================================
  // SECTION 1: Basic Functions
  // ============================================
  // Functions are reusable blocks of code.
  // Why? Instead of writing the same code 100 times, write it once in a function.
  print("--- SECTION 1: Basic Functions ---");
  
  // Call a simple function that takes a parameter
  greetUser("Sachin");
  greetUser("Alex");  // Can call it again with different data!
  
  // Call a function that returns a value (from Class 01, we learned return types)
  int result = add(10, 20);
  print("Result of addition: $result");
  
  // Function that takes multiple parameters
  String status = getStatus("Flutter", true);
  print(status);

  // ============================================
  // SECTION 2: Arrow Functions (Short Syntax)
  // ============================================
  // Arrow functions (=>) are a shorter way to write simple functions
  // Useful when the function is just one line
  print("\n--- SECTION 2: Arrow Functions ---");
  
  print("Square of 5 is ${getSquare(5)}");
  print("Cube of 3 is ${getCube(3)}");
  
  // Arrow functions are often used with calculations (from Class 02)
  double fahrenheit = convertCelsius(25.0);
  print("25°C is ${fahrenheit}°F");

  // ============================================
  // SECTION 3: Named Parameters (CRITICAL FOR FLUTTER)
  // ============================================
  // Named parameters use {} instead of ()
  // Advantage: You MUST use parameter names when calling (safer code)
  // This is how 90% of Flutter code is written!
  print("\n--- SECTION 3: Named Parameters ---");
  
  // Notice we use parameter names here: brand: "Dell", ram: 16
  describeDevice(brand: "Dell", ram: 16);
  
  // Order doesn't matter with named parameters!
  describeDevice(ram: 8, brand: "Raspberry Pi");
  
  // This is similar to how you'll write Flutter Widgets:
  print("\nFlutter-like syntax (you'll use this constantly):");
  createButton(label: "Click Me", color: "Blue", size: 20);
  createButton(label: "Submit", color: "Green");  // Can skip optional params
  
  // Another example: creating a user profile
  print("\nUser Profile:");
  createUser(username: "alex123", email: "alex@example.com", age: 20);

  // ============================================
  // SECTION 4: Mixed Parameters (Positional + Named)
  // ============================================
  // Sometimes you need BOTH positional (required in order) and named parameters
  // Positional come first in (), named parameters come in {}
  print("\n--- SECTION 4: Mixed Parameters ---");
  
  // fileName is positional (required), destination is named (required)
  uploadFile("data.csv", destination: "/server/uploads");
  
  // Another example: sending a message with required recipient and optional settings
  print("\nSending Message:");
  sendMessage("Hello World", recipient: "bob@email.com", priority: "high");
  sendMessage("Urgent!", recipient: "admin@email.com");  // priority uses default

  // ============================================
  // SECTION 5: Functions with Conditionals (Class 02 + Class 03)
  // ============================================
  // Functions can contain conditionals (if/else from Class 02)
  print("\n--- SECTION 5: Functions with Logic ---");
  
  int score = 85;
  String grade = calculateGrade(score);
  print("Score $score gets grade: $grade");
  
  // Function combining loops (Class 02) and functions (Class 03)
  print("\nFactorial of 5: ${factorial(5)}");
}

// ============================================
// FUNCTION DEFINITIONS
// ============================================

// 1. Basic Function (void = no return value)
void greetUser(String name) {
  print("Welcome, $name!");
}

// 2. Function with return type
int add(int a, int b) {
  return a + b;
}

// 3. Function with multiple parameters
String getStatus(String framework, bool isReady) {
  if (isReady) {
    return "Ready to build $framework apps!";
  } else {
    return "$framework not ready yet";
  }
}

// 4. Arrow Function (short syntax for one-line functions)
int getSquare(int n) => n * n;
int getCube(int n) => n * n * n;

// 5. Arrow function with calculation
double convertCelsius(double celsius) => (celsius * 9 / 5) + 32;

// 6. Named Parameters (all required)
void describeDevice({required String brand, required int ram}) {
  print("Device: $brand with ${ram}GB RAM");
}

// 7. Flutter-style Named Parameters with defaults
void createButton({
  required String label,
  String color = "Gray",
  int size = 14
}) {
  print("Button: '$label' (Color: $color, Size: $size)");
}

// 8. Named parameters with control flow
void createUser({
  required String username,
  required String email,
  int age = 18
}) {
  if (age < 18) {
    print("Warning: User $username is a minor");
  }
  print("Created user: $username ($email), Age: $age");
}

// 9. Mixed Parameters (Positional + Named)
void uploadFile(String fileName, {required String destination}) {
  print("Uploading $fileName to $destination...");
}

// 10. Mixed with optional named parameter
void sendMessage(String message, {required String recipient, String priority = "normal"}) {
  print("Sending to $recipient: '$message' (Priority: $priority)");
}

// 11. Function with conditionals (Class 02 logic)
String calculateGrade(int score) {
  if (score >= 90) return "A+";
  if (score >= 80) return "A";
  if (score >= 70) return "B";
  return "C";
}

// 12. Function with loop (Class 02 loop, Class 03 function)
int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result = result * i;
  }
  return result;
}