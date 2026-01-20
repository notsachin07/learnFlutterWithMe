// Solutions for Class 04 Exercises

void main() {
  // --- Solution 1 ---
  print("--- Exercise 1: Smartphone ---");
  Smartphone myPhone = Smartphone("Pixel", 128);
  print("New phone: ${myPhone.brand}");
  myPhone.useApp();
  myPhone.useApp();

  // --- Solution 2 ---
  print("\n--- Exercise 2: Rectangle ---");
  Rectangle rect = Rectangle(10, 5);
  print("Rectangle Area (10x5): ${rect.getArea()}");

  Rectangle sq = Rectangle.square(4);
  print("Square Area (4x4): ${sq.getArea()}");

  // --- Solution 3 ---
  print("\n--- Exercise 3: Flutter Sim ---");
  // This syntax is 90% of what you will type in Flutter
  var header = TextWidget(
    text: "Welcome Home",
    fontSize: 24,
  );
  
  var body = TextWidget(
    text: "This is the body text",
    // color uses default "Black"
    // fontSize uses default 14
  );

  header.render();
  body.render();
}

// 1. Smartphone
class Smartphone {
  String brand;
  int storage;
  int batteryPercentage = 100; // Default value

  Smartphone(this.brand, this.storage);

  void useApp() {
    batteryPercentage -= 10;
    print("Using app... Battery at $batteryPercentage%");
  }
}

// 2. Rectangle
class Rectangle {
  double width;
  double height;

  // Standard Constructor
  Rectangle(this.width, this.height);

  // Named Constructor
  Rectangle.square(double size) {
    width = size;
    height = size;
  }

  double getArea() => width * height;
}

// 3. TextWidget (Flutter Simulation)
class TextWidget {
  String text;
  String color;
  int fontSize;

  // Named Parameters with 'required' and default values
  TextWidget({
    required this.text,
    this.color = "Black",
    this.fontSize = 14,
  });

  void render() {
    print("Displaying Text: '$text' (Color: $color, Size: $fontSize)");
  }
}