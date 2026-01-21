// Class 05 - Inheritance & Polymorphism - Solutions
// Run this using: dart solution_05.dart
// This file contains reference implementations for all exercises in Class 05

import 'dart:io';

// ============================================================
// EXERCISE 1: Animal Sanctuary Management 🦁
// ============================================================

// Parent class: All animals share these properties and methods
class Animal {
  String name;
  int age;
  String dietType;

  Animal(this.name, this.age, this.dietType);

  void eat() => print("$name is eating $dietType");
  void sleep() => print("$name is sleeping for 8 hours");
  void makeSound() => print("$name makes a generic sound");
}

// Child class 1: Lion extends Animal
class Lion extends Animal {
  Lion(String name, int age, String dietType) : super(name, age, dietType);

  @override
  void makeSound() => print("$name roars: ROOOAARRR!");

  void hunt() => print("$name is hunting in the savanna");
}

// Child class 2: Penguin extends Animal
class Penguin extends Animal {
  Penguin(String name, int age, String dietType) : super(name, age, dietType);

  @override
  void makeSound() => print("$name chirps: Squawk squawk!");

  void swim() => print("$name is swimming in icy waters");
}

// Child class 3: Parrot extends Animal with additional vocabulary
class Parrot extends Animal {
  List<String> vocabulary;

  Parrot(String name, int age, String dietType, this.vocabulary)
      : super(name, age, dietType);

  @override
  void makeSound() => print("$name squawks: ${vocabulary.isNotEmpty ? vocabulary[0] : "..."}");

  void learn(String word) {
    vocabulary.add(word);
    print("$name learned: $word");
  }
}

// ============================================================
// EXERCISE 2: Bank Account System 🏦
// ============================================================

// Parent class: Base bank account with common operations
class BankAccount {
  String accountNumber;
  double balance;

  BankAccount(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
    print("✅ Deposited: \$$amount. New balance: \$${balance.toStringAsFixed(2)}");
  }

  void withdraw(double amount) {
    if (balance >= amount) {
      balance -= amount;
      print("✅ Withdrew: \$$amount. New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("❌ Insufficient balance! Current balance: \$${balance.toStringAsFixed(2)}");
    }
  }

  void displayInfo() {
    print("📊 Account #$accountNumber | Balance: \$${balance.toStringAsFixed(2)}");
  }
}

// Child class 1: Savings Account with interest
class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(String accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void deposit(double amount) {
    super.deposit(amount);
    double interest = amount * interestRate / 100;
    balance += interest;
    print("💰 Interest added: \$${interest.toStringAsFixed(2)} (Rate: $interestRate%)");
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("   Interest Rate: $interestRate%");
  }
}

// Child class 2: Checking Account with overdraft
class CheckingAccount extends BankAccount {
  double overdraftLimit;

  CheckingAccount(String accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (balance + overdraftLimit >= amount) {
      balance -= amount;
      print("✅ Withdrew: \$$amount. New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("❌ Exceeds overdraft limit! Max available: \$${(balance + overdraftLimit).toStringAsFixed(2)}");
    }
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("   Overdraft Limit: \$${overdraftLimit.toStringAsFixed(2)}");
  }
}

// Child class 3: Money Market Account with monthly withdrawal limit
class MoneyMarketAccount extends BankAccount {
  int monthlyWithdrawals = 0;
  int maxWithdrawals;
  double penaltyFee;

  MoneyMarketAccount(String accountNumber, double balance, this.maxWithdrawals,
      this.penaltyFee)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (monthlyWithdrawals < maxWithdrawals) {
      balance -= amount;
      monthlyWithdrawals++;
      print("✅ Withdrew: \$$amount. New balance: \$${balance.toStringAsFixed(2)}");
      print("   (Withdrawal $monthlyWithdrawals of $maxWithdrawals this month)");
    } else {
      balance -= penaltyFee;
      print("⚠️  Withdrawal limit exceeded! Penalty fee: \$$penaltyFee charged.");
      print("   New balance: \$${balance.toStringAsFixed(2)}");
    }
  }

  void resetMonthlyCounter() {
    monthlyWithdrawals = 0;
    print("🔄 Monthly withdrawal counter reset!");
  }

  @override
  void displayInfo() {
    super.displayInfo();
    print("   Monthly Withdrawals: $monthlyWithdrawals / $maxWithdrawals");
    print("   Penalty Fee: \$$penaltyFee");
  }
}

// ============================================================
// EXERCISE 3: Widget System (Flutter Preparation!) 📱
// ============================================================

// Base Widget class
class Widget3 {
  String? key;

  Widget3({this.key});

  void render() => print("[Widget]");
}

// Text Widget
class Text3 extends Widget3 {
  String text;
  double fontSize;
  bool bold;

  Text3({
    this.text = "",
    this.fontSize = 14,
    this.bold = false,
    String? key,
  }) : super(key: key);

  @override
  void render() {
    String boldText = bold ? " [BOLD]" : "";
    print("[Text] \"$text\" (fontSize: $fontSize$boldText)");
  }
}

// Button Widget
class Button3 extends Widget3 {
  String label;
  String onPressed;

  Button3({
    this.label = "",
    this.onPressed = "Action",
    String? key,
  }) : super(key: key);

  @override
  void render() {
    print("[Button] \"$label\" → onPressed: $onPressed");
  }
}

// Container Widget (can hold child)
class Container3 extends Widget3 {
  double width;
  double height;
  String color;
  Widget3? child;

  Container3({
    this.width = 100,
    this.height = 100,
    this.color = "white",
    this.child,
    String? key,
  }) : super(key: key);

  @override
  void render() {
    print("[Container] ${width.toStringAsFixed(0)}x${height.toStringAsFixed(0)} ($color)");
    if (child != null) {
      stdout.write("  └─ ");
      child!.render();
    }
  }
}

// ============================================================
// EXERCISE 4: University Course System 🎓
// ============================================================

// Base Course class
class Course {
  String courseCode;
  String title;
  int credits;
  int maxStudents;
  int enrolledStudents = 0;

  Course(this.courseCode, this.title, this.credits, this.maxStudents);

  void enroll() {
    if (!isFull()) {
      enrolledStudents++;
      print("✅ Enrolled in $courseCode");
    } else {
      print("❌ $courseCode is full!");
    }
  }

  bool isFull() => enrolledStudents >= maxStudents;

  String getGrade(int score) {
    if (score >= 90) return "A";
    if (score >= 80) return "B";
    if (score >= 70) return "C";
    if (score >= 60) return "D";
    return "F";
  }

  void info() {
    print("📚 Course: $courseCode - $title");
    print("   Credits: $credits | Enrolled: $enrolledStudents/$maxStudents");
  }
}

// Lab Course with smaller capacity
class LabCourse extends Course {
  int labHours;

  LabCourse(String courseCode, String title, int credits, int maxStudents,
      this.labHours)
      : super(courseCode, title, credits, maxStudents ~/ 2);

  @override
  String getGrade(int score) {
    if (score >= 90) return "A";
    if (score >= 80) return "B";
    if (score >= 75) return "C";
    return "F";
  }

  @override
  void info() {
    super.info();
    print("   🔬 Lab hours: $labHours per week");
  }
}

// Online Course with unlimited enrollment
class OnlineCourse extends Course {
  bool hasExam;

  OnlineCourse(String courseCode, String title, int credits, this.hasExam)
      : super(courseCode, title, credits, 999); // Essentially unlimited

  @override
  void enroll() {
    enrolledStudents++;
    print("✅ Enrolled in $courseCode (Online - Unlimited spots)");
  }

  @override
  String getGrade(int score) {
    if (!hasExam) {
      return score >= 70 ? "Pass" : "Fail";
    }
    if (score >= 92) return "A";
    if (score >= 82) return "B";
    if (score >= 72) return "C";
    if (score >= 62) return "D";
    return "F";
  }

  @override
  void info() {
    super.info();
    print("   💻 Online | Exam required: ${hasExam ? "Yes" : "No"}");
  }
}

// Honors Course with prerequisite
class HonorsCourse extends Course {
  double prerequisiteGPA;

  HonorsCourse(String courseCode, String title, int credits,
      this.prerequisiteGPA)
      : super(courseCode, title, credits, 20);

  @override
  String getGrade(int score) {
    if (score >= 92) return "A";
    if (score >= 85) return "B";
    if (score >= 78) return "C";
    return "F";
  }

  @override
  void info() {
    super.info();
    print("   🏆 Honors | Prerequisite GPA: $prerequisiteGPA");
  }
}

// ============================================================
// MAIN PROGRAM
// ============================================================

void main() {
  print("╔════════════════════════════════════════════════════════════════╗");
  print("║  EXERCISE 1: Animal Sanctuary Management  🦁                   ║");
  print("╚════════════════════════════════════════════════════════════════╝\n");

  print("--- Testing Animal Sanctuary ---\n");

  Lion simba = Lion("Simba", 7, "Meat");
  print("Lion Simba behavior:");
  simba.eat();
  simba.sleep();
  simba.makeSound();
  simba.hunt();

  print("");

  Penguin pingu = Penguin("Pingu", 3, "Fish");
  print("Penguin Pingu behavior:");
  pingu.eat();
  pingu.sleep();
  pingu.makeSound();
  pingu.swim();

  print("");

  Parrot polly = Parrot("Polly", 2, "Fruits", ["Hello", "Squawk"]);
  print("Parrot Polly behavior:");
  polly.eat();
  polly.sleep();
  polly.makeSound();
  polly.learn("Goodbye");
  polly.makeSound();

  // Polymorphic collection
  print("\n--- Polymorphic Sanctuary Collection ---\n");

  List<Animal> sanctuary = [
    Lion("Leo", 5, "Meat"),
    Penguin("Pip", 4, "Fish"),
    Parrot("Captain", 3, "Seeds", ["Hello"]),
    Lion("Nala", 6, "Meat"),
    Penguin("Pebbles", 2, "Fish"),
  ];

  print("All animals in sanctuary making sounds:");
  for (var animal in sanctuary) {
    animal.makeSound();
  }

  print("\n--- BONUS: Type Checking with 'is' operator ---\n");

  for (var animal in sanctuary) {
    stdout.write("${animal.name}: ");
    if (animal is Lion) {
      print("🦁 (Lion)");
      animal.hunt();
    } else if (animal is Penguin) {
      print("🐧 (Penguin)");
      animal.swim();
    } else if (animal is Parrot) {
      print("🦜 (Parrot)");
      animal.learn("Sanctuary!");
    }
  }

  // ============================================================
  // EXERCISE 2: Bank Account System 🏦
  // ============================================================

  print("\n\n╔════════════════════════════════════════════════════════════════╗");
  print("║  EXERCISE 2: Bank Account System 🏦                             ║");
  print("╚════════════════════════════════════════════════════════════════╝\n");

  print("--- Testing Bank Account System ---\n");

  print("=== SAVINGS ACCOUNT ===");
  SavingsAccount savings = SavingsAccount("SAV001", 1000, 2.5);
  savings.displayInfo();
  print("");
  savings.deposit(100);
  savings.displayInfo();

  print("\n=== CHECKING ACCOUNT ===");
  CheckingAccount checking = CheckingAccount("CHK001", 500, 200);
  checking.displayInfo();
  print("");
  checking.withdraw(600);
  checking.displayInfo();

  print("\n=== MONEY MARKET ACCOUNT ===");
  MoneyMarketAccount moneyMarket = MoneyMarketAccount("MM001", 5000, 3, 50);
  moneyMarket.displayInfo();
  print("");
  moneyMarket.withdraw(500);
  moneyMarket.withdraw(300);
  moneyMarket.withdraw(200);
  moneyMarket.withdraw(100);
  moneyMarket.displayInfo();

  // Polymorphic collection
  print("\n--- Polymorphic Account Processing ---\n");

  List<BankAccount> accounts = [
    SavingsAccount("SAV002", 2000, 3),
    CheckingAccount("CHK002", 1500, 300),
    MoneyMarketAccount("MM002", 10000, 3, 50),
  ];

  print("Displaying all accounts:\n");
  for (var i = 0; i < accounts.length; i++) {
    if (i > 0) print("");
    accounts[i].displayInfo();
  }

  // ============================================================
  // EXERCISE 3: Widget System (Flutter Preparation!) 📱
  // ============================================================

  print("\n\n╔════════════════════════════════════════════════════════════════╗");
  print("║  EXERCISE 3: Widget System (Flutter Prep!) 📱                  ║");
  print("╚════════════════════════════════════════════════════════════════╝\n");

  print("--- Testing Widget System ---\n");

  print("=== Individual Widgets ===\n");

  var w1 = Text3(text: "Hello World", fontSize: 14, bold: false);
  w1.render();

  var w2 = Button3(label: "Click Me", onPressed: "Navigate to home");
  w2.render();

  var w3 = Container3(width: 300, height: 200, color: "blue");
  w3.render();

  print("\n=== Nested Widget (Container with Text Child) ===\n");

  var w4 = Container3(
    width: 300,
    height: 200,
    color: "blue",
    child: Text3(text: "Welcome", fontSize: 18, bold: true),
  );

  w4.render();

  print("\n=== Polymorphic Widget List ---\n");

  List<Widget3> widgets = [
    Text3(text: "Introduction", fontSize: 16, bold: false),
    Button3(label: "Start", onPressed: "Begin app"),
    Container3(
      width: 200,
      height: 100,
      color: "white",
      child: Text3(text: "Login", fontSize: 12, bold: true),
    ),
    Text3(text: "Choose an option", fontSize: 14, bold: false),
    Button3(label: "Settings", onPressed: "Show settings"),
  ];

  print("Rendering all widgets:\n");
  for (var widget in widgets) {
    widget.render();
  }

  // ============================================================
  // EXERCISE 4: University Course System 🎓
  // ============================================================

  print("\n\n╔════════════════════════════════════════════════════════════════╗");
  print("║  EXERCISE 4: University Course System 🎓                       ║");
  print("╚════════════════════════════════════════════════════════════════╝\n");

  print("--- Testing Course Management System ---\n");

  print("=== Creating Courses ===\n");

  Course regular = Course("CS101", "Intro to Programming", 4, 30);
  LabCourse lab = LabCourse("CS102", "Physics Lab", 3, 40, 3);
  OnlineCourse online = OnlineCourse("CS201", "Web Development", 3, true);
  HonorsCourse honors = HonorsCourse("CS301", "Advanced Algorithms", 4, 3.5);

  print("=== Enrolling Students ===\n");
  regular.enroll();
  regular.enroll();
  lab.enroll();
  online.enroll();
  online.enroll();
  honors.enroll();

  print("\n=== Course Information ===\n");
  regular.info();
  print("");
  lab.info();
  print("");
  online.info();
  print("");
  honors.info();

  print("\n=== Grade Calculations ===\n");
  print("Regular course score 88: ${regular.getGrade(88)}");
  print("Lab course score 85: ${lab.getGrade(85)} (needs 75 minimum)");
  print("Online course score 95: ${online.getGrade(95)}");
  print("Honors course score 88: ${honors.getGrade(88)}");

  print("\n--- Polymorphic Course Processing ---\n");

  List<Course> courses = [
    Course("CS101", "Intro to Programming", 4, 30),
    LabCourse("CS102", "Physics Lab", 3, 40, 3),
    OnlineCourse("CS201", "Web Development", 3, true),
    HonorsCourse("CS301", "Advanced Algorithms", 4, 3.5),
  ];

  print("All courses information:\n");
  for (var i = 0; i < courses.length; i++) {
    if (i > 0) print("");
    courses[i].info();
  }

  // ============================================================
  // KEY LEARNING CONCEPTS
  // ============================================================

  print("\n\n╔════════════════════════════════════════════════════════════════╗");
  print("║  KEY INHERITANCE & POLYMORPHISM PATTERNS                        ║");
  print("╚════════════════════════════════════════════════════════════════╝\n");

  print("""
✅ INHERITANCE PATTERNS:
  1. Simple Inheritance (Lion, Penguin, Parrot extend Animal)
  2. Method Override (each animal makes different sounds)
  3. Using super keyword (calling parent constructors)
  4. Specialized properties (vocabulary in Parrot)

✅ POLYMORPHISM PATTERNS:
  1. Polymorphic collections (List<Animal>, List<BankAccount>)
  2. Dynamic method dispatch (correct method called per type)
  3. Type checking with 'is' operator
  4. Type casting with 'as' operator

✅ REAL-WORLD APPLICATIONS:
  1. Animal Sanctuary - biological hierarchies
  2. Banking System - financial services
  3. Widget System - Flutter-like components
  4. University Courses - enrollment management

✅ FLUTTER PREPARATION:
  • Inheritance used heavily in Flutter (Widget, etc.)
  • Named parameters in constructors (Flutter style!)
  • Polymorphism enables flexible widget system
  • Inheritance prepares you for advanced Flutter patterns

Next: Study abstract classes and interfaces for more powerful patterns! 🚀
""");
}
