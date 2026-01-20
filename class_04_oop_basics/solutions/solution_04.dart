// Class 04 - Solutions for Exercises
// Run this using: dart solutions/solution_04.dart
// Builds on: Class 01 (Variables, Types), Class 02 (Loops, Conditionals), Class 03 (Functions), Class 04 lessons (Classes, Constructors)

void main() {
  // =========================================
  // EXERCISE 1: The Smartphone Class
  // =========================================
  // Learning Goal: Classes with properties, constructors, and methods
  // Concepts: properties, constructors, methods, state management
  
  print("===== EXERCISE 1: Smartphone Class =====");
  
  // Create a smartphone object
  // The constructor is called automatically when you use 'new' (or just call the constructor)
  var myPhone = Smartphone("Samsung", 256);
  print("Created: ${myPhone.brand} with ${myPhone.storage}GB storage");
  print("Battery: ${myPhone.batteryPercentage}%\n");
  
  // Each method call modifies the object's state (battery decreases)
  print("Using apps:");
  myPhone.useApp();
  myPhone.useApp();
  myPhone.useApp();
  
  // The battery value persists—objects remember their state!
  print("Final battery: ${myPhone.batteryPercentage}%");
  
  // Create another phone to show objects are independent
  var anotherPhone = Smartphone("Apple", 128);
  print("\nSecond phone: ${anotherPhone.brand}");
  print("Its battery: ${anotherPhone.batteryPercentage}% (not affected by first phone)");


  // =========================================
  // EXERCISE 2: The Rectangle (Named Constructors)
  // =========================================
  // Learning Goal: Multiple ways to create objects (standard + named constructors)
  // Concepts: standard constructors, named constructors, methods, calculations
  
  print("\n===== EXERCISE 2: Rectangle Class =====");
  
  // Standard constructor: create a rectangle with specific width and height
  Rectangle rect = Rectangle(10, 6);
  print("Rectangle (${rect.width} × ${rect.height}):");
  print("  Area: ${rect.getArea()}");
  print("  Perimeter: ${rect.getPerimeter()}");
  
  // Named constructor: create a square more easily
  // Rectangle.square(size) automatically sets width = height = size
  Rectangle square = Rectangle.square(5);
  print("\nSquare (${square.width} × ${square.height}) - using named constructor:");
  print("  Area: ${square.getArea()}");
  print("  Perimeter: ${square.getPerimeter()}");
  
  // Another example: different sized square
  Rectangle largeSquare = Rectangle.square(8);
  print("\nSquare (${largeSquare.width} × ${largeSquare.height}):");
  print("  Area: ${largeSquare.getArea()}");


  // =========================================
  // EXERCISE 3: Flutter Simulation (TextWidget)
  // =========================================
  // Learning Goal: Named parameter constructors (Flutter pattern!)
  // Concepts: named parameters, required vs. optional, default values, Flutter-style syntax
  
  print("\n===== EXERCISE 3: Flutter-Style TextWidget =====");
  
  // Create widgets using named parameters (EXACTLY like Flutter!)
  
  // Widget 1: With custom font size, using default color
  var header = TextWidget(
    text: "Welcome Home",
    fontSize: 24,
    // color defaults to "Black"
  );
  header.display();
  
  // Widget 2: With custom color, using default font size
  var subtitle = TextWidget(
    text: "Subtitle",
    color: "Blue",
    fontSize: 18,
  );
  subtitle.display();
  
  // Widget 3: Using all defaults except required text
  var button = TextWidget(
    text: "Click Me",
    // color defaults to "Black"
    // fontSize defaults to 14
  );
  button.display();
  
  // Widget 4: Show the flexibility of named parameters
  // Parameters can be in ANY order!
  var custom = TextWidget(
    fontSize: 20,        // First parameter
    color: "Green",      // Second
    text: "Important",   // Third
  );
  custom.display();


  // =========================================
  // BONUS: Combining Multiple Objects
  // =========================================
  // Show how objects work together
  
  print("\n===== BONUS: Multiple Objects Working Together =====");
  
  // Create multiple phones and show they're independent
  List<Smartphone> phones = [
    Smartphone("iPhone", 64),
    Smartphone("Pixel", 128),
    Smartphone("OnePlus", 256),
  ];
  
  print("Fleet of phones:");
  for (var phone in phones) {
    print("${phone.brand} (${phone.storage}GB, ${phone.batteryPercentage}% battery)");
    phone.useApp();
    print("  After use: ${phone.batteryPercentage}%");
  }
  
  // Create multiple rectangles and find the largest
  print("\nFinding largest rectangle:");
  Rectangle r1 = Rectangle(4, 5);    // Area = 20
  Rectangle r2 = Rectangle(3, 7);    // Area = 21
  Rectangle r3 = Rectangle.square(4); // Area = 16
  
  double maxArea = 0;
  String maxDesc = "";
  
  if (r1.getArea() > maxArea) {
    maxArea = r1.getArea();
    maxDesc = "Rectangle 4×5";
  }
  if (r2.getArea() > maxArea) {
    maxArea = r2.getArea();
    maxDesc = "Rectangle 3×7";
  }
  if (r3.getArea() > maxArea) {
    maxArea = r3.getArea();
    maxDesc = "Square 4×4";
  }
  
  print("Largest: $maxDesc with area $maxArea");


  // =========================================
  // KEY PATTERNS FROM THIS CLASS
  // =========================================
  print("\n===== KEY LEARNING PATTERNS =====");
  print("✓ Pattern 1: Classes bundle data (properties) + behavior (methods)");
  print("✓ Pattern 2: Constructors initialize objects automatically");
  print("✓ Pattern 3: Named constructors allow multiple creation methods");
  print("✓ Pattern 4: Objects maintain state across method calls");
  print("✓ Pattern 5: Named parameters make code readable (Flutter style!)");
}


// ============================================
// CLASS DEFINITIONS
// ============================================

// EXERCISE 1: Smartphone Class
class Smartphone {
  // Properties (data that describes a smartphone)
  String brand;           // What brand? (Samsung, Apple, etc.)
  int storage;            // How much storage? (64GB, 128GB, etc.)
  int batteryPercentage = 100;  // Current battery level (0-100), starts at 100
  
  // Constructor: runs automatically when you create an object
  // Initializes the properties with values you provide
  Smartphone(this.brand, this.storage) {
    // 'this.brand = brand' shorthand: 'this.brand' gets brand parameter
    batteryPercentage = 100;  // Always start with full battery
  }
  
  // Method: what can a smartphone DO?
  void useApp() {
    // Reduce battery by 10% each time an app is used
    batteryPercentage -= 10;
    
    if (batteryPercentage >= 0) {
      print("📱 Using app on $brand... Battery at $batteryPercentage%");
    } else {
      print("⚠️ Battery critically low on $brand!");
      batteryPercentage = 0;  // Don't let it go below 0
    }
  }
  
  // Bonus method: charge the phone
  void charge() {
    batteryPercentage = 100;
    print("🔌 $brand charged to 100%");
  }
}


// EXERCISE 2: Rectangle Class (with Named Constructors)
class Rectangle {
  // Properties
  double width;
  double height;
  
  // Standard Constructor: create a rectangle with specific dimensions
  // Syntax: ClassName(parameters) { body }
  // This shorthand: Rectangle(this.width, this.height) automatically
  // sets this.width = width and this.height = height
  Rectangle(this.width, this.height);
  
  // Named Constructor: alternative way to create objects
  // Syntax: ClassName.constructorName(parameters) : property = value, ...;
  // This is useful for rectangles that are squares (width = height)
  Rectangle.square(double size)
    : width = size,
      height = size;
  
  // Bonus named constructor: create a copy of another rectangle
  Rectangle.copy(Rectangle other)
    : width = other.width,
      height = other.height;
  
  // Method: calculate the area
  double getArea() => width * height;
  
  // Method: calculate the perimeter
  double getPerimeter() => 2 * (width + height);
  
  // Method: check if this is a square
  bool isSquare() => width == height;
}


// EXERCISE 3: TextWidget (Flutter-Style Class)
// This demonstrates the EXACT pattern used in Flutter widgets!
class TextWidget {
  // Properties (what data does a text widget have?)
  String text;     // The text to display
  String color;    // Text color
  int fontSize;    // Font size in pixels
  
  // Constructor with NAMED PARAMETERS (Flutter style!)
  // Named parameters go in { } brackets
  // 'required' means the parameter MUST be provided
  // Default values apply if parameter is omitted
  TextWidget({
    required this.text,     // Must provide this (required)
    this.color = "Black",   // Optional (defaults to "Black" if not provided)
    this.fontSize = 14,     // Optional (defaults to 14 if not provided)
  });
  
  // Method: display information about this widget
  void display() {
    print("========= TEXT WIDGET =========");
    print('Text: "$text"');
    print("Color: $color");
    print("Size: ${fontSize}px");
    print("==============================\n");
  }
}