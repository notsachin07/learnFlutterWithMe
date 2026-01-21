# Lesson 5.2: Polymorphism & Method Overriding 🎭

**Builds on:** Lesson 5.1 (Inheritance Basics), Class 04 (Classes & Constructors)

## What is Polymorphism?

**Polymorphism** means "many forms." In OOP, it allows a child class to be used **wherever a parent class is expected**. This enables flexible, dynamic code that can work with different types seamlessly.

### The Key Power: Treating Children as Parents

One of the most powerful features of inheritance is that **you can use a child object anywhere the parent type is expected**:

```dart
class Animal {
  void makeSound() {
    print("Generic sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

void main() {
  // Both of these work:
  Dog dog = Dog();           // As a Dog
  Animal animal = Dog();     // As an Animal!
  
  dog.makeSound();       // Prints: Woof!
  animal.makeSound();    // Also prints: Woof! (polymorphism!)
}
```

Even though `animal` is declared as type `Animal`, it's actually a `Dog` object, so it calls Dog's `makeSound()` method!

## Why Polymorphism Matters

### Without Polymorphism (repetitive code):
```dart
void playSound(Dog dog) {
  dog.makeSound();
}

void playSound(Cat cat) {
  cat.makeSound();
}

void playSound(Bird bird) {
  bird.makeSound();
}

void main() {
  playSound(Dog());
  playSound(Cat());
  playSound(Bird());
}
```

**Problem:** Need a separate function for each type! 😞

### With Polymorphism (elegant code):
```dart
void playSound(Animal animal) {
  animal.makeSound();  // Works with ANY Animal type!
}

void main() {
  playSound(Dog());    // Calls Dog's makeSound()
  playSound(Cat());    // Calls Cat's makeSound()
  playSound(Bird());   // Calls Bird's makeSound()
}
```

**Benefit:** One function works with all types! 🎉

## Collections with Polymorphism

The real power emerges when storing different child types in a **parent-type collection**:

```dart
class Animal {
  String name;
  Animal(this.name);
  
  void makeSound() {
    print("$name: Generic sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("$name: Woof!");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("$name: Meow!");
  }
}

class Bird extends Animal {
  @override
  void makeSound() {
    print("$name: Tweet!");
  }
}

void main() {
  // List<Animal> can hold Dog, Cat, Bird (all are Animals)
  List<Animal> animals = [
    Dog("Rex"),
    Cat("Whiskers"),
    Bird("Tweety"),
    Dog("Max"),
  ];
  
  // Call makeSound() on ALL - each does its own thing!
  for (var animal in animals) {
    animal.makeSound();
  }
  
  // Output:
  // Rex: Woof!
  // Whiskers: Meow!
  // Tweety: Tweet!
  // Max: Woof!
}
```

This is **polymorphism in action**: Each animal "responds" according to its own type, even though we're treating them all as `Animal`.

## Method Overriding Details

### The `@override` Annotation

Always use `@override` when replacing a parent's method. It:
- ✅ Makes your intention clear to other developers
- ✅ Helps catch typos (if parent method name changes, you'll get an error)
- ✅ Improves code readability

```dart
class Parent {
  void doSomething() {
    print("Parent version");
  }
}

class Child extends Parent {
  @override  // This tells everyone we're intentionally replacing the method
  void doSomething() {
    print("Child version");
  }
}
```

### Accessing Parent Methods with `super`

Sometimes you want to **extend** the parent's behavior, not completely replace it:

```dart
class Animal {
  void describe() {
    print("This is an animal");
  }
}

class Dog extends Animal {
  String breed;
  
  Dog(this.breed);
  
  @override
  void describe() {
    super.describe();  // ← Call parent's version first
    print("This is a dog of breed: $breed");
  }
}

void main() {
  var dog = Dog("Golden Retriever");
  dog.describe();
  
  // Output:
  // This is an animal
  // This is a dog of breed: Golden Retriever
}
```

The `super.describe()` call runs the **parent's method**, then the child adds additional output.

## Real-World Example: Bank Accounts

```dart
// PARENT CLASS
class BankAccount {
  String accountNumber;
  double balance;
  
  BankAccount(this.accountNumber, this.balance);
  
  void deposit(double amount) {
    balance += amount;
    print("Deposited: \$$amount. New balance: \$$balance");
  }
  
  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      print("Withdrew: \$$amount. New balance: \$$balance");
    } else {
      print("Insufficient funds!");
    }
  }
  
  void displayInfo() {
    print("Account: $accountNumber | Balance: \$$balance");
  }
}

// CHILD CLASS 1: Savings Account
class SavingsAccount extends BankAccount {
  double interestRate;
  
  SavingsAccount(String accountNumber, double balance, this.interestRate)
    : super(accountNumber, balance);
  
  @override
  void deposit(double amount) {
    super.deposit(amount);  // Use parent's deposit
    double interest = amount * interestRate / 100;
    balance += interest;
    print("Interest added: \$$interest");
  }
  
  @override
  void displayInfo() {
    super.displayInfo();  // Use parent's displayInfo
    print("Interest Rate: $interestRate%");
  }
}

// CHILD CLASS 2: Checking Account
class CheckingAccount extends BankAccount {
  double overdraftLimit;
  
  CheckingAccount(String accountNumber, double balance, this.overdraftLimit)
    : super(accountNumber, balance);
  
  @override
  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance -= amount;
      print("Withdrew: \$$amount. New balance: \$$balance");
    } else {
      print("Exceeds overdraft limit!");
    }
  }
}

void main() {
  var savingsAccount = SavingsAccount("SAV001", 1000, 2.5);
  var checkingAccount = CheckingAccount("CHK001", 500, 200);
  
  print("=== Using as their specific type ===");
  savingsAccount.deposit(100);      // Deposit + interest
  checkingAccount.withdraw(600);     // Can go $100 into overdraft
  
  print("\n=== Using polymorphically (all as BankAccount) ===");
  List<BankAccount> accounts = [savingsAccount, checkingAccount];
  
  for (var account in accounts) {
    account.displayInfo();
    print("---");
  }
}
```

## Polymorphic Behavior: Each Type Responds Differently

```dart
abstract class Shape {
  void display() {
    print("Generic shape");
  }
  
  double calculateArea();
}

class Rectangle extends Shape {
  double width, height;
  
  Rectangle(this.width, this.height);
  
  @override
  void display() {
    print("Rectangle: $width x $height");
  }
  
  @override
  double calculateArea() => width * height;
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  void display() {
    print("Circle: radius $radius");
  }
  
  @override
  double calculateArea() => 3.14 * radius * radius;
}

void main() {
  // All stored as Shape type
  List<Shape> shapes = [
    Rectangle(5, 10),
    Circle(3),
    Rectangle(4, 4),
  ];
  
  // Polymorphism: each displays and calculates its own way
  for (var shape in shapes) {
    shape.display();
    print("Area: ${shape.calculateArea()}\n");
  }
  
  // Output:
  // Rectangle: 5 x 10
  // Area: 50.0
  //
  // Circle: radius 3
  // Area: 28.26
  //
  // Rectangle: 4 x 4
  // Area: 16.0
}
```

## Type Checking: Verifying Object Types

Sometimes you need to know what **specific type** an object is:

```dart
class Animal {
  void makeSound() {}
}

class Dog extends Animal {
  @override
  void makeSound() => print("Woof!");
  
  void fetch() => print("Fetching!");
}

class Cat extends Animal {
  @override
  void makeSound() => print("Meow!");
}

void main() {
  List<Animal> animals = [Dog(), Cat(), Dog()];
  
  for (var animal in animals) {
    animal.makeSound();  // Polymorphism works
    
    // Check if it's specifically a Dog
    if (animal is Dog) {
      var dog = animal as Dog;  // Cast to Dog
      dog.fetch();  // Now can use Dog-specific method
    }
  }
  
  // Output:
  // Woof!
  // Fetching!
  // Meow!
  // Woof!
  // Fetching!
}
```

**Key keywords:**
- `is` — Check if object is a specific type
- `as` — Cast (convert) to a specific type

## Pattern: Polymorphic Processing

Common pattern for processing mixed collections:

```dart
class Vehicle {
  String make;
  Vehicle(this.make);
  
  void start() => print("$make: Starting engine");
}

class Car extends Vehicle {
  int doors;
  Car(String make, this.doors) : super(make);
}

class Motorcycle extends Vehicle {
  Motorcycle(String make) : super(make);
}

void serviceFleet(List<Vehicle> vehicles) {
  for (var vehicle in vehicles) {
    vehicle.start();  // Polymorphic call
    
    // Handle type-specific logic
    if (vehicle is Car) {
      print("Checking $vehicle.doors doors");
    } else if (vehicle is Motorcycle) {
      print("Checking motorcycle tires");
    }
  }
}

void main() {
  var fleet = [
    Car("Toyota", 4),
    Motorcycle("Harley"),
    Car("Honda", 2),
  ];
  
  serviceFleet(fleet);
}
```

## Key Concepts Summary

| Concept | Meaning |
|---------|---------|
| **Polymorphism** | Using child objects as parent type |
| **Override** | Replace parent method with child version |
| **super** | Call parent's method/constructor |
| **@override** | Annotation marking intentional method replacement |
| **is** | Type checking operator |
| **as** | Type casting operator |

## Benefits of Polymorphism

✅ **Flexibility** — Write functions that work with parent type, automatically work with all children  
✅ **Extensibility** — Add new child classes without changing existing code  
✅ **Cleaner Code** — Avoid if/else chains for different types  
✅ **Real-World Modeling** — Reflects how things actually relate (Dog IS-A Animal)  
✅ **Collections** — Store mixed child types in parent-type collections  

## Common Mistakes

❌ **Forgetting super in child constructor**
```dart
class Child extends Parent {
  Child() : super();  // Must call parent constructor!
}
```

❌ **Forgetting @override annotation**
```dart
@override  // Always include this
void method() { }
```

❌ **Wrong type in override**
```dart
// Parent has: void draw()
// Child has: int draw()  ← Type mismatch! Wrong!
```

❌ **Trying to call child-only methods on parent type**
```dart
Animal animal = Dog();
animal.fetch();  // Error! fetch() only exists on Dog
```

---

**Next:** Practice inheritance and polymorphism with exercises in [exercises.md](exercises.md) 🎯
