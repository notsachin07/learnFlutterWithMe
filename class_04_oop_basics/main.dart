// Class 04 - Source Code
// Run this using: dart main.dart
//
// Note: This class builds on Class 01 (variables), Class 02 (control flow),
// and Class 03 (functions & named parameters).
// Classes are blueprints. Objects are created from blueprints.
// 90% of Flutter is just combining classes together!

void main() {
  // ============================================
  // SECTION 1: Basic Classes and Objects
  // ============================================
  // A class is like a blueprint. An object is an instance of that blueprint.
  // Think: class = cookie cutter, object = actual cookie
  print("--- SECTION 1: Basic Classes and Objects ---");
  
  // Creating an instance (object) of Robot class
  Robot myRobot = Robot();
  
  // Accessing properties (variables inside the class)
  myRobot.name = "Terminator";
  
  // Calling methods (functions inside the class)
  myRobot.speak();
  
  // Create another robot with different name
  Robot helpfulRobot = Robot();
  helpfulRobot.name = "C-3PO";
  helpfulRobot.speak();

  // ============================================
  // SECTION 2: Constructors (Initialization)
  // ============================================
  // Constructors run automatically when you create an object.
  // They set up initial values. From Class 01: we set variables.
  // Now: we set them at creation time!
  print("\n--- SECTION 2: Constructors ---");
  
  // Using constructor with parameters (short syntax)
  // This is much cleaner than creating, then assigning properties
  Person student = Person("Sachin", "Computer Science");
  student.introduce();
  
  // Create another person
  Person teacher = Person("Dr. Smith", "Physics");
  teacher.introduce();
  
  // Students from Class 01 example
  Person alice = Person("Alice", "Mathematics");
  Person bob = Person("Bob", "Chemistry");
  alice.introduce();
  bob.introduce();

  // ============================================
  // SECTION 3: Named Parameters in Classes (CRITICAL FOR FLUTTER)
  // ============================================
  // Classes can use named parameters just like functions (from Class 03)!
  // This is exactly how Flutter Widgets work.
  // When you build Flutter apps, you'll write code that looks like this.
  print("\n--- SECTION 3: Named Parameters in Classes ---");
  
  // CustomButton with named parameters
  // Notice this looks EXACTLY like Flutter code!
  CustomButton btn = CustomButton(
    label: "Submit", 
    color: "Blue",
    isEnabled: true
  );
  btn.draw();
  
  // Another button, reordering parameters (named params allow this)
  CustomButton btn2 = CustomButton(
    color: "Red",
    label: "Cancel",
    isEnabled: false
  );
  btn2.draw();
  
  // Using default value for isEnabled
  CustomButton btn3 = CustomButton(
    label: "OK",
    color: "Green"
    // isEnabled defaults to true
  );
  btn3.draw();

  // ============================================
  // SECTION 4: Methods with Conditionals (Class 02 + Class 04)
  // ============================================
  // Methods can contain logic from Class 02 (if/else, loops)
  print("\n--- SECTION 4: Methods with Logic ---");
  
  Person student2 = Person("Jordan", "Engineering");
  student2.describe();  // Method with internal logic
  
  // Smartphone example (from exercises)
  Smartphone phone = Smartphone("iPhone", 256);
  print("New phone created: ${phone.brand}");
  phone.useApp();
  phone.useApp();
  print("Battery: ${phone.batteryPercentage}%");

  // ============================================
  // SECTION 5: Multiple Objects Interacting
  // ============================================
  // Objects can work together (real programs have many objects)
  print("\n--- SECTION 5: Multiple Objects Working Together ---");
  
  Person prof = Person("Dr. Johnson", "Computer Science");
  Person student3 = Person("Sam", "Data Science");
  
  prof.introduce();
  student3.introduce();
}

// ============================================
// CLASS DEFINITIONS
// ============================================

// 1. Basic Class (from main SECTION 1)
// Properties (variables) and Methods (functions)
class Robot {
  String name = "Bot"; // Default value (property)

  // Method: a function inside a class
  void speak() {
    print("I am $name. Systems nominal.");
  }
}

// 2. Class with Constructor (from main SECTION 2)
class Person {
  String name;
  String major;

  // Constructor: runs when you create a Person object
  // Short syntax: Person(this.name, this.major);
  // This automatically assigns parameters to properties
  Person(this.name, this.major);

  // Method: introduce yourself
  void introduce() {
    print("👤 Hi, I'm $name and I study $major.");
  }
  
  // Method with logic (combining Class 02 + Class 04)
  void describe() {
    String majorLength = major.length > 10 ? "long" : "short";
    print("$name studies $major (that's a $majorLength major name)");
  }
}

// 3. Class with Named Parameters (from main SECTION 3)
// This mimics how Flutter Widgets are created
class CustomButton {
  String label;
  String color;
  bool isEnabled;

  // Constructor with Named Parameters {}
  // This looks like: CustomButton(label: "text", color: "blue", isEnabled: true)
  // EXACTLY like Flutter!
  CustomButton({
    required this.label,           // Must provide this
    required this.color,           // Must provide this
    this.isEnabled = true           // Optional, defaults to true
  });

  // Method to display button
  void draw() {
    String status = isEnabled ? "✓ Active" : "✗ Disabled";
    print("[Button] '$label' ($color) - $status");
  }
}

// 4. Class with Methods Containing Logic (from main SECTION 4)
class Smartphone {
  String brand;
  int storage;
  int batteryPercentage = 100; // Default value

  // Constructor (sets brand and storage)
  Smartphone(this.brand, this.storage);

  // Method with logic (from Class 02)
  void useApp() {
    batteryPercentage -= 10;  // Decrease battery
    if (batteryPercentage <= 0) {
      print("⚠️ Phone dead! Charging...");
      batteryPercentage = 100;
    } else {
      print("📱 Using app... Battery at $batteryPercentage%");
    }
  }
}