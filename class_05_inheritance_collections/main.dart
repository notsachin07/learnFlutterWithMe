// Class 05 - Source Code
// Run this using: dart main.dart
//
// Note: This class builds on Class 04 (Classes & Constructors).
// Inheritance allows child classes to inherit properties and methods from parent classes.
// This is DRY (Don't Repeat Yourself) in action!

// ============================================================
// SECTION 1: Basic Inheritance - Animal Hierarchy
// ============================================================

class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void eat() => print("$name is eating");
  void sleep() => print("$name is sleeping");
  void makeSound() => print("$name makes a generic sound");
}

class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void makeSound() => print("$name the $breed barks: Woof! Woof!");

  void fetch() => print("$name is fetching the ball");
}

class Cat extends Animal {
  bool isIndoor;

  Cat(String name, int age, this.isIndoor) : super(name, age);

  @override
  void makeSound() => print("$name meows: Meow! Meow!");

  void scratch() => print("$name is scratching the furniture");
}

// ============================================================
// SECTION 4: Method Overriding with super
// ============================================================

class Vehicle {
  String make;
  String model;

  Vehicle(this.make, this.model);

  void info() => print("Vehicle: $make $model");
}

class Car extends Vehicle {
  int doors;

  Car(String make, String model, this.doors) : super(make, model);

  @override
  void info() {
    super.info();
    print("This is a car with $doors doors");
  }
}

class ElectricCar extends Vehicle {
  int batteryPercentage;

  ElectricCar(String make, String model, this.batteryPercentage)
      : super(make, model);

  @override
  void info() {
    super.info();
    print("This is an electric car (Battery: $batteryPercentage%)");
  }
}

// ============================================================
// SECTION 6: Real-World: Shape Hierarchy
// ============================================================

class Shape {
  String color;

  Shape(this.color);

  void display() => print("Shape with color: $color");
  double getArea() => 0.0;
}

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(String color, this.width, this.height) : super(color);

  @override
  void display() {
    print("Rectangle ($color): $width x $height");
  }

  @override
  double getArea() => width * height;
}

class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);

  @override
  void display() {
    print("Circle ($color): radius $radius");
  }

  @override
  double getArea() => 3.14 * radius * radius;
}

class Triangle extends Shape {
  double base;
  double height;

  Triangle(String color, this.base, this.height) : super(color);

  @override
  void display() {
    print("Triangle ($color): base $base, height $height");
  }

  @override
  double getArea() => (base * height) / 2;
}

// ============================================================
// SECTION 7: Employee Types
// ============================================================

class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void work() => print("$name is working");
  void getSalaryInfo() => print("$name earns: \$$salary");
}

class Developer extends Employee {
  String language;

  Developer(String name, double salary, this.language) : super(name, salary);

  @override
  void work() {
    print("$name is coding in $language");
  }
}

class Manager extends Employee {
  int teamSize;

  Manager(String name, double salary, this.teamSize) : super(name, salary);

  @override
  void work() {
    print("$name is managing $teamSize team members");
  }
}

class Designer extends Employee {
  String specialty;

  Designer(String name, double salary, this.specialty) : super(name, salary);

  @override
  void work() {
    print("$name is designing ($specialty)");
  }
}

// ============================================================
// MAIN PROGRAM
// ============================================================

void main() {
  print("--- SECTION 1: Basic Inheritance - Animal Hierarchy ---\n");

  var rex = Dog("Rex", 5, "Golden Retriever");
  var whiskers = Cat("Whiskers", 3, true);

  rex.eat();
  rex.makeSound();
  rex.fetch();

  whiskers.sleep();
  whiskers.makeSound();
  whiskers.scratch();

  // ============================================================
  // SECTION 2: Polymorphism - Using Children as Parents
  // ============================================================

  print("\n--- SECTION 2: Polymorphism - Using Children as Parents ---\n");

  void animalAction(Animal animal) {
    print("Processing: ${animal.name}");
    animal.makeSound();
    animal.eat();
    print("");
  }

  animalAction(rex);
  animalAction(whiskers);

  // ============================================================
  // SECTION 3: Polymorphic Collections
  // ============================================================

  print("--- SECTION 3: Polymorphic Collections ---\n");

  List<Animal> animals = [
    Dog("Max", 4, "Labrador"),
    Cat("Mittens", 2, false),
    Dog("Buddy", 6, "German Shepherd"),
    Cat("Shadow", 7, true),
  ];

  print("All animals making sounds:");
  for (var animal in animals) {
    animal.makeSound();
  }

  print("\nAll animals eating:");
  for (var animal in animals) {
    animal.eat();
  }

  // ============================================================
  // SECTION 4: Method Overriding with super
  // ============================================================

  print("\n--- SECTION 4: Using super to Extend Parent Behavior ---\n");

  var tesla = ElectricCar("Tesla", "Model 3", 85);
  tesla.info();

  print("");

  var ford = Car("Ford", "F-150", 4);
  ford.info();

  // ============================================================
  // SECTION 5: Type Checking & Casting
  // ============================================================

  print("\n--- SECTION 5: Type Checking & Casting (is & as) ---\n");

  List<Vehicle> vehicles = [
    Car("Honda", "Civic", 4),
    ElectricCar("Nissan", "Leaf", 92),
    Car("Toyota", "Corolla", 4),
  ];

  print("Processing mixed vehicle fleet:\n");

  for (var vehicle in vehicles) {
    print("Checking ${vehicle.make} ${vehicle.model}:");

    if (vehicle is ElectricCar) {
      print("  ⚡ Electric vehicle detected!");
      print("  Battery level: ${vehicle.batteryPercentage}%");
    } else if (vehicle is Car) {
      print("  🚗 Gas vehicle detected!");
      print("  Doors: ${vehicle.doors}");
    }
    print("");
  }

  // ============================================================
  // SECTION 6: Real-World: Shape Hierarchy
  // ============================================================

  print("--- SECTION 6: Shape Hierarchy with Polymorphic Calculation ---\n");

  List<Shape> shapes = [
    Rectangle("Red", 5, 10),
    Circle("Blue", 4),
    Triangle("Green", 6, 8),
    Rectangle("Yellow", 3, 7),
    Circle("Purple", 2),
  ];

  print("Shape Gallery:\n");

  double totalArea = 0;

  for (var shape in shapes) {
    shape.display();
    double area = shape.getArea();
    print("Area: ${area.toStringAsFixed(2)}\n");
    totalArea += area;
  }

  print("Total area of all shapes: ${totalArea.toStringAsFixed(2)}");

  // ============================================================
  // SECTION 7: Practice Polymorphism with Employee Types
  // ============================================================

  print("\n--- SECTION 7: Practice Polymorphism with Worker Types ---\n");

  List<Employee> employees = [
    Developer("Alice", 95000, "Dart"),
    Manager("Bob", 110000, 5),
    Designer("Carol", 80000, "UI/UX"),
    Developer("David", 92000, "Flutter"),
  ];

  print("Company Work Day:\n");

  for (var emp in employees) {
    emp.work();
  }

  print("\nSalary Report:\n");

  for (var emp in employees) {
    emp.getSalaryInfo();
  }

  double totalPayroll = employees.fold(0.0, (sum, emp) => sum + emp.salary);
  print("\nTotal monthly payroll: \$${totalPayroll.toStringAsFixed(2)}");

  // ============================================================
  // KEY CONCEPTS DEMONSTRATED
  // ============================================================

  print("\n╔════════════════════════════════════════════════════════════════╗");
  print("║             KEY INHERITANCE CONCEPTS DEMONSTRATED              ║");
  print("╚════════════════════════════════════════════════════════════════╝");

  print("""
1. ✅ Inheritance with extends keyword
2. ✅ Child inherits parent properties and methods
3. ✅ Method overriding with @override
4. ✅ Using super to access parent methods/constructors
5. ✅ Polymorphism - using children as parent type
6. ✅ Polymorphic collections (List<Parent>)
7. ✅ Type checking with 'is' operator
8. ✅ Type casting with 'as' operator
9. ✅ Real-world hierarchies (Animals, Vehicles, Shapes, Employees)

🎓 Flutter Connection:
   • Flutter uses inheritance EVERYWHERE (Widget, StatelessWidget, etc.)
   • Most Flutter apps combine widgets (which are classes!) together
   • Understanding inheritance makes Flutter much easier!

📚 Next Step: Study abstract classes and interfaces for even more power!
""");
}
