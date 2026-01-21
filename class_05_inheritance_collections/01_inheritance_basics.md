# Lesson 5.1: Inheritance Basics - Parent & Child Classes 🧬

**Builds on:** Class 04 (Classes & Constructors)

## What is Inheritance?

Inheritance allows you to create a **new class based on an existing class**. The new class (child/subclass) **inherits all properties and methods** from the existing class (parent/superclass).

### The Problem It Solves

Imagine you're creating an animal simulator:

❌ **Without inheritance (code duplication):**
```dart
class Dog {
  String name;
  int age;
  void eat() => print("$name is eating");
  void sleep() => print("$name is sleeping");
}

class Cat {
  String name;
  int age;
  void eat() => print("$name is eating");
  void sleep() => print("$name is sleeping");
}
```

Notice we're repeating `name`, `age`, `eat()`, and `sleep()` in both classes!

✅ **With inheritance (DRY principle):**
```dart
class Animal {  // Parent class
  String name;
  int age;
  void eat() => print("$name is eating");
  void sleep() => print("$name is sleeping");
}

class Dog extends Animal {}  // Child inherits everything
class Cat extends Animal {}  // Child inherits everything
```

Much cleaner! Dog and Cat automatically get `name`, `age`, `eat()`, and `sleep()` without rewriting.

## The `extends` Keyword

Use `extends` to create a child class that inherits from a parent class.

```dart
class Parent {
  // Parent properties and methods
}

class Child extends Parent {
  // Inherits everything from Parent
  // Can add new properties and methods
}
```

### Example: Animal Hierarchy

```dart
// PARENT CLASS (superclass)
class Animal {
  String name;
  int age;
  
  Animal(this.name, this.age);
  
  void eat() {
    print("$name is eating");
  }
  
  void sleep() {
    print("$name is sleeping");
  }
  
  void makeSound() {
    print("$name makes a sound");
  }
}

// CHILD CLASS (subclass) - inherits from Animal
class Dog extends Animal {
  String breed;
  
  // Constructor must call parent constructor using 'super'
  Dog(String name, int age, this.breed) : super(name, age);
  
  // Override inherited method
  @override
  void makeSound() {
    print("$name barks: Woof!");
  }
  
  // Add new method unique to Dog
  void fetch() {
    print("$name is fetching the ball");
  }
}

// Another child class
class Cat extends Animal {
  bool isIndoor;
  
  Cat(String name, int age, this.isIndoor) : super(name, age);
  
  @override
  void makeSound() {
    print("$name meows: Meow!");
  }
  
  void scratch() {
    print("$name is scratching");
  }
}

void main() {
  // Create instances of child classes
  var dog = Dog("Rex", 5, "Golden Retriever");
  var cat = Cat("Whiskers", 3, true);
  
  // Use inherited methods
  dog.eat();      // Output: Rex is eating
  dog.sleep();    // Output: Rex is sleeping
  
  // Use overridden methods
  dog.makeSound();  // Output: Rex barks: Woof!
  cat.makeSound();  // Output: Whiskers meows: Meow!
  
  // Use child-specific methods
  dog.fetch();      // Output: Rex is fetching the ball
  cat.scratch();    // Output: Whiskers is scratching
}
```

## Key Concepts

### 1. Inheritance Chain
A child inherits **everything** from the parent:
```
Dog "IS-A" Animal → gets all properties and methods from Animal
Cat "IS-A" Animal → gets all properties and methods from Animal
```

### 2. Constructor Chaining with `super`

When you create a child class with a constructor, you must call the **parent constructor** using the `super` keyword:

```dart
class Animal {
  String name;
  Animal(this.name);  // Parent constructor
}

class Dog extends Animal {
  String breed;
  
  // Must call parent constructor with super
  Dog(String name, this.breed) : super(name);
}
```

The colon `:` followed by `super(name)` ensures the parent class is properly initialized.

### 3. Method Overriding

A child class can **override** (replace) inherited methods with its own implementation:

```dart
class Animal {
  void makeSound() {
    print("Generic animal sound");
  }
}

class Dog extends Animal {
  @override  // Annotation indicating you're overriding a parent method
  void makeSound() {
    print("Woof! Woof!");  // Different implementation
  }
}
```

The `@override` annotation is not required but highly recommended—it tells developers you're intentionally changing the method.

### 4. Calling Parent Methods with `super`

Sometimes you want to keep the parent's method behavior AND add new behavior:

```dart
class Animal {
  void describe() {
    print("This is an animal");
  }
}

class Dog extends Animal {
  @override
  void describe() {
    super.describe();  // Call parent method first
    print("More specifically, this is a dog");
  }
}

void main() {
  var dog = Dog();
  dog.describe();
  // Output:
  // This is an animal
  // More specifically, this is a dog
}
```

## Inheritance Hierarchy Example: Vehicles

```dart
// BASE (Parent) CLASS
class Vehicle {
  String make;
  String model;
  int year;
  
  Vehicle(this.make, this.model, this.year);
  
  void drive() {
    print("$year $make $model is driving");
  }
  
  void stop() {
    print("$make stopped");
  }
}

// CHILD CLASS 1
class Car extends Vehicle {
  int doors;
  
  Car(String make, String model, int year, this.doors) 
    : super(make, model, year);
  
  @override
  void drive() {
    print("🚗 $make $model (Car with $doors doors) is driving");
  }
}

// CHILD CLASS 2
class Motorcycle extends Vehicle {
  bool hasSidecar;
  
  Motorcycle(String make, String model, int year, this.hasSidecar) 
    : super(make, model, year);
  
  @override
  void drive() {
    String sidecar = hasSidecar ? "with sidecar" : "solo";
    print("🏍️ $make $model (Motorcycle $sidecar) is driving");
  }
}

void main() {
  var car = Car("Toyota", "Camry", 2023, 4);
  var motorcycle = Motorcycle("Harley-Davidson", "Street 750", 2022, false);
  
  car.drive();           // 🚗 Toyota Camry (Car with 4 doors) is driving
  motorcycle.drive();    // 🏍️ Harley-Davidson Street 750 (Motorcycle solo) is driving
  
  car.stop();            // Toyota stopped
  motorcycle.stop();     // Harley-Davidson stopped
}
```

## Common Pattern: Adding to Inherited Methods

Often you override a method but still want the parent's behavior:

```dart
class Shape {
  String color;
  
  Shape(this.color);
  
  void describe() {
    print("Shape with color: $color");
  }
}

class Circle extends Shape {
  double radius;
  
  Circle(String color, this.radius) : super(color);
  
  @override
  void describe() {
    super.describe();  // Keep parent's description
    print("Circle with radius: $radius");
    print("Area: ${3.14 * radius * radius}");
  }
}

void main() {
  var circle = Circle("Red", 5.0);
  circle.describe();
  // Output:
  // Shape with color: Red
  // Circle with radius: 5.0
  // Area: 78.5
}
```

## Benefits of Inheritance

✅ **Code Reuse** — Write common code once in parent, use everywhere  
✅ **Clear Relationships** — Shows "IS-A" relationships (Dog IS-A Animal)  
✅ **Easier Maintenance** — Change parent class, all children benefit  
✅ **Polymorphism** — Use child objects where parent type is expected (next lesson!)  
✅ **Logical Organization** — Organize code hierarchically  

## Important Rules

1. **One parent class only** — Dart doesn't support multiple inheritance (one `extends` per class)
2. **Constructor must call super** — If parent has constructor, child must call it
3. **Override when behavior changes** — Child implements method differently than parent
4. **Use super for parent access** — Call parent methods with `super.methodName()`
5. **Child gets all public members** — All properties and methods (unless marked private with `_`)

---

**Next:** Learn how to treat child objects as parent types in [02_polymorphism.md](02_polymorphism.md) 🚀
