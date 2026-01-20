// Class 04 - Source Code
// Run this using: dart main.dart

void main() {
  print("--- SECTION 1: Basic Objects ---");
  // Creating an instance of Robot
  Robot myRobot = Robot();
  myRobot.name = "Terminator";
  myRobot.speak();


  print("\n--- SECTION 2: Constructors ---");
  // Using the short constructor
  Person student = Person("Sachin", "Computer Science");
  student.introduce();


  print("\n--- SECTION 3: Named Parameters (Flutter Style) ---");
  // This looks almost exactly like a Flutter Widget!
  CustomButton btn = CustomButton(
    label: "Submit", 
    color: "Blue",
    isEnabled: true
  );
  btn.draw();
  
  // Using default value for isEnabled
  CustomButton btn2 = CustomButton(label: "Cancel", color: "Red");
  btn2.draw();
}

// 1. Basic Class
class Robot {
  String name = "Bot"; // Default value

  void speak() {
    print("I am $name. Systems nominal.");
  }
}

// 2. Class with Constructor
class Person {
  String name;
  String major;

  // Constructor (Short Syntax)
  Person(this.name, this.major);

  void introduce() {
    print("Hi, I'm $name and I study $major.");
  }
}

// 3. Class mimicking a Flutter Widget
class CustomButton {
  String label;
  String color;
  bool isEnabled;

  // Constructor with Named Parameters {}
  CustomButton({
    required this.label, 
    required this.color, 
    this.isEnabled = true // Default value
  });

  void draw() {
    String status = isEnabled ? "Active" : "Disabled";
    print("[Button] $label ($color) - $status");
  }
}