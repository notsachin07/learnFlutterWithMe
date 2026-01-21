# Class 05 Exercises: Inheritance & Polymorphism 🎯

**Builds on:** Class 04 (Classes & Constructors)

## Exercise 1: Animal Sanctuary Management 🦁

### 🎯 Objective
Create an animal sanctuary system using inheritance and polymorphism. Practice:
- Creating parent and child classes
- Implementing constructors with `super`
- Overriding methods
- Using polymorphic collections

### 📝 Description

You're building a management system for an animal sanctuary. All animals have common properties (name, age, diet type) and behaviors (eat, sleep, makeSound). Different animals have different sounds and specific behaviors.

### 💡 Key Concepts
- **Inheritance**: All animals share common structure
- **Polymorphism**: Process all animals uniformly, each responds its own way
- **Method Override**: Each animal makes its own sound
- **super keyword**: Call parent constructor to initialize shared properties

### 📋 Requirements

Create a program that:

1. **Define a parent class `Animal`** with:
   - Properties: `name` (String), `age` (int), `dietType` (String)
   - Constructor: `Animal(this.name, this.age, this.dietType)`
   - Methods:
     - `eat()` → prints: "$name is eating $dietType"
     - `sleep()` → prints: "$name is sleeping for 8 hours"
     - `makeSound()` → prints: "$name makes a generic sound"

2. **Create child class `Lion` extends Animal** with:
   - Constructor that calls `super`
   - Override `makeSound()` → prints: "$name roars: ROOOAARRR!"
   - Method `hunt()` → prints: "$name is hunting in the savanna"

3. **Create child class `Penguin` extends Animal** with:
   - Constructor that calls `super`
   - Override `makeSound()` → prints: "$name chirps: Squawk squawk!"
   - Method `swim()` → prints: "$name is swimming in icy waters"

4. **Create child class `Parrot` extends Animal** with:
   - Additional property: `vocabulary` (List of Strings)
   - Constructor that calls `super`
   - Override `makeSound()` → prints: "$name squawks: ${vocabulary[0]}" (say first word in vocabulary)
   - Method `learn(String word)` → adds word to vocabulary, prints: "$name learned: $word"

5. **In main():**
   - Create instances: `lion = Lion("Simba", 7, "Meat")`
   - Create instances: `penguin = Penguin("Pingu", 3, "Fish")`
   - Create parrot: `parrot = Parrot("Polly", 2, "Fruits", ["Hello", "Squawk"])`
   - Use each animal with inherited methods (`eat()`, `sleep()`)
   - Use each animal's specific method (`hunt()`, `swim()`, `learn()`)
   - Create `List<Animal>` and call `makeSound()` on each (polymorphism!)

### 📊 Expected Output Sample
```
Simba is eating Meat
Simba is sleeping for 8 hours
Simba roars: ROOOAARRR!
Simba is hunting in the savanna

Pingu is eating Fish
Pingu is sleeping for 8 hours
Pingu chirps: Squawk squawk!
Pingu is swimming in icy waters

Polly is eating Fruits
Polly is sleeping for 8 hours
Polly squawks: Hello
Polly learned: Goodbye

All animals in sanctuary making sounds:
Simba roars: ROOOAARRR!
Pingu chirps: Squawk squawk!
Polly squawks: Hello
```

### 💪 Challenges (Optional Bonus)

**Level 1 - Extend vocabulary:**
- Add more animals (Tiger, Elephant, Monkey)
- Add more methods to each (grooming, playing, etc.)

**Level 2 - Using super:**
- Override `eat()` in each child to add special behavior
- Use `super.eat()` first, then add unique behavior
- Example: Lion eats, then naps immediately

**Level 3 - Type checking:**
- Loop through animal list and use `is` operator to check type
- If it's a Parrot, teach it a new word
- If it's a Lion, tell it to hunt
- If it's a Penguin, tell it to swim

---

## Exercise 2: Bank Account System 🏦

### 🎯 Objective
Design a bank system with different account types using inheritance and method overriding. Practice:
- Extending parent class functionality
- Overriding methods to customize behavior
- Using `super` to call parent methods
- Polymorphic collections with mixed account types

### 📝 Description

A bank offers multiple account types. All accounts have basic operations (deposit, withdraw, display info), but each type has unique rules and features.

### 💡 Key Concepts
- **Inheritance hierarchy**: BankAccount (parent) → SavingsAccount, CheckingAccount, MoneyMarket
- **Method override**: Different withdrawal/interest rules per account
- **super keyword**: Keep parent behavior, enhance with child-specific rules
- **Polymorphic processing**: Process all accounts uniformly

### 📋 Requirements

1. **Create parent class `BankAccount`** with:
   - Properties: `accountNumber` (String), `balance` (double)
   - Constructor: `BankAccount(this.accountNumber, this.balance)`
   - Methods:
     - `deposit(double amount)` → add to balance, print confirmation
     - `withdraw(double amount)` → subtract from balance if sufficient, print result
     - `displayInfo()` → print account number and balance

2. **Create `SavingsAccount extends BankAccount`** with:
   - Additional property: `interestRate` (double) - percentage
   - Constructor calls `super`
   - Override `deposit()`:
     - Call `super.deposit(amount)`
     - Calculate interest: `interest = amount * interestRate / 100`
     - Add interest to balance
     - Print interest added
   - Override `displayInfo()`:
     - Call `super.displayInfo()`
     - Print interest rate

3. **Create `CheckingAccount extends BankAccount`** with:
   - Additional property: `overdraftLimit` (double)
   - Constructor calls `super`
   - Override `withdraw()`:
     - Allow withdrawal if `balance + overdraftLimit >= amount`
     - Otherwise reject and print "Exceeds overdraft limit!"
   - Override `displayInfo()`:
     - Call `super.displayInfo()`
     - Print overdraft limit

4. **Create `MoneyMarketAccount extends BankAccount`** with:
   - Additional properties: `monthlyWithdrawals` (int), `maxWithdrawals` (int - usually 3)
   - Additional property: `penaltyFee` (double)
   - Constructor calls `super`
   - Override `withdraw()`:
     - Check if `monthlyWithdrawals < maxWithdrawals`
     - If yes: withdraw and increment counter
     - If no: charge penalty fee, print "Withdrawal limit exceeded! \$penalty charged"
   - Add `resetMonthlyCounter()` method

5. **In main():**
   - Create: `savings = SavingsAccount("SAV001", 1000, 2.5)`
   - Create: `checking = CheckingAccount("CHK001", 500, 200)`
   - Create: `moneyMarket = MoneyMarketAccount("MM001", 5000, 3, 50)`
   - Test each account's special behavior
   - Create `List<BankAccount>` with mixed types
   - Loop and call `displayInfo()` on all (polymorphism!)

### 📊 Expected Output Sample
```
=== SavingsAccount Deposit with Interest ===
Deposited: $100. New balance: $1100
Interest added: $2.5

=== CheckingAccount with Overdraft ===
Withdrew: $600. New balance: -$100

=== MoneyMarketAccount Withdrawal Limit ===
Withdrew: $500. New balance: $4500 (Withdrawal 1 of 3)
Withdrew: $300. New balance: $4200 (Withdrawal 2 of 3)
Withdrew: $200. New balance: $4000 (Withdrawal 3 of 3)
Withdrawal limit exceeded! $50 penalty charged. New balance: $3950

=== Display All Account Info ===
Account: SAV001 | Balance: $1102.5
Interest Rate: 2.5%
---
Account: CHK001 | Balance: -$100
Overdraft Limit: $200
---
Account: MM001 | Balance: $3950
Max Monthly Withdrawals: 3 (Used: 4)
```

### 💪 Challenges (Optional Bonus)

**Level 1 - Add features:**
- Add `transfer(BankAccount other, double amount)` method
- Add transaction history tracking

**Level 2 - Enhance calculations:**
- Add annual interest calculation (compound interest)
- Add monthly fee for checking account

**Level 3 - Advanced polymorphism:**
- Create function `processMonthEnd(List<BankAccount> accounts)` that:
  - Applies monthly interest to savings
  - Deducts monthly fees from checking
  - Resets withdrawal counter for money market
  - Handles each account type appropriately

---

## Exercise 3: Widget System (Flutter Preparation!) 📱

### 🎯 Objective
Create a Flutter-like widget system to understand how Flutter's widget hierarchy works. Practice:
- Real Flutter patterns using Dart inheritance
- Widget composition and hierarchy
- Polymorphic rendering
- Constructor and named parameters

### 📝 Description

Flutter has a `Widget` parent class, and different widget types extend it (Text, Button, Container, etc.). You'll build a simplified version to understand how Flutter uses inheritance and polymorphism internally.

### 💡 Key Concepts
- **Flutter Pattern**: Many specific widgets inherit from base Widget class
- **Polymorphism**: Different widgets "render" differently
- **Named parameters**: Widget constructors use extensive named parameters
- **Composition**: Widgets contain other widgets

### 📋 Requirements

1. **Create abstract concept parent `Widget`** with:
   - Property: `key` (String - optional, for identification)
   - Constructor with named parameter
   - Abstract concept: `render()` - each widget renders differently

2. **Create `Text extends Widget`** with:
   - Properties: `text` (String), `fontSize` (double), `bold` (bool)
   - Named parameter constructor
   - `render()` → prints widget representation (styled based on fontSize, bold)

3. **Create `Button extends Widget`** with:
   - Properties: `label` (String), `onPressed` (String - description)
   - Named parameter constructor
   - `render()` → prints button representation with label and action

4. **Create `Container extends Widget`** with:
   - Properties: `width` (double), `height` (double), `color` (String)
   - Property: `child` (Widget? - can hold another widget or null)
   - Named parameter constructor (child optional)
   - `render()` → prints container box, then renders child if present

5. **In main():**
   - Create individual widgets with named parameters
   - Create nested widgets (Container with Text child)
   - Create `List<Widget>` with different widget types
   - Loop and call `render()` on all (polymorphism!)

### 📊 Expected Output Sample
```
=== Individual Widgets ===
[Text] "Hello World" (fontSize: 14, bold: false)
[Button] "Click Me" → onPressed: Navigate to home

=== Nested Widget (Container with Text) ===
[Container] 300x200 (blue)
  └─ [Text] "Welcome" (fontSize: 18, bold: true)

=== Widget List (Polymorphic Rendering) ===
[Text] "Introduction" (fontSize: 16, bold: false)
[Button] "Start" → onPressed: Begin app
[Container] 200x100 (white)
  └─ [Text] "Login" (fontSize: 12, bold: true)
```

### 💪 Challenges (Optional Bonus)

**Level 1 - More widgets:**
- Add `Row` widget that holds multiple children in horizontal layout
- Add `Column` widget that holds multiple children in vertical layout
- Add `Image` widget with path and size

**Level 2 - Enhance rendering:**
- Add visual representation (ASCII art style)
- Add padding/margin to containers
- Add proper hierarchy indentation in output

**Level 3 - Widget styling:**
- Create `TextStyle` class with properties
- Create `BoxDecoration` class for container styling
- Use these in widgets to build a more realistic Flutter system

---

## Exercise 4: University Course System (Complex Hierarchy) 🎓

### 🎯 Objective
Build a course enrollment system demonstrating multiple inheritance patterns and complex polymorphism. This is a **comprehensive exercise** combining all inheritance concepts.

### 📝 Description

A university has different types of courses with different enrollment rules, grading systems, and requirements. Create a system that handles courses polymorphically while each type implements its specific logic.

### 💡 Key Concepts
- **Complex inheritance**: Multiple related classes
- **Polymorphic collections**: Handle different course types uniformly
- **Conditional overrides**: Different grading for different course types
- **Business logic**: Real-world course management rules

### 📋 Requirements

1. **Create parent `Course`** with:
   - Properties: `courseCode` (String), `title` (String), `credits` (int), `maxStudents` (int)
   - Property: `enrolledStudents` (int) - track enrollments
   - Constructor
   - Methods:
     - `enroll()` → if space available, increment enrolledStudents
     - `isFull()` → check if maxStudents reached
     - `getGrade(int score)` → base implementation: A=90+, B=80+, C=70+, D=60+, F=<60
     - `info()` → print course details

2. **Create `LabCourse extends Course`** with:
   - Additional property: `labHours` (int)
   - Override `enroll()`:
     - Check space (call parent? or check directly)
     - Lab courses have smaller max (max = half of regular)
   - Override `getGrade()`:
     - Lab courses require 75+ to pass
     - A=90+, B=80+, C=75+, F=<75
   - Override `info()`:
     - Call `super.info()`
     - Add "Lab hours: $labHours per week"

3. **Create `OnlineCourse extends Course`** with:
   - Additional property: `hasExam` (bool)
   - Override `enroll()`:
     - Online courses have unlimited enrollment
   - Override `getGrade()`:
     - If no exam: only use assignment average
     - If exam: A=92+, B=82+, C=72+, D=62+, F=<62
   - Override `info()`:
     - Call `super.info()`
     - Print "Online" and "Exam required: $hasExam"

4. **Create `HonorsCourse extends Course`** with:
   - Additional property: `prerequisiteGPA` (double)
   - Override `enroll()`:
     - Check GPA requirement (you can use a dummy check)
     - Limited to max 20 students
   - Override `getGrade()`:
     - Honors requires higher standard: A=92+, B=85+, C=78+, F=<78
   - Override `info()`:
     - Call `super.info()`
     - Print "Honors - Prerequisite GPA: $prerequisiteGPA"

5. **In main():**
   - Create courses of each type
   - Process enrollment polymorphically
   - Calculate grades for each course type
   - Display all courses (polymorphism!)
   - Create `List<Course>` and process all uniformly

### 📊 Expected Output Sample
```
=== Course Enrollment System ===

CS101 - Intro to Programming [Regular] (4 credits, 30 spots)
Lab hours: 3 per week
Enrolled: 25/30

CS102 - Advanced OOP [Online] (3 credits, Unlimited)
Online - Exam required: true
Enrolled: 45/Unlimited

CS201 - Data Structures [Honors] (4 credits, 20 spots)
Honors - Prerequisite GPA: 3.5
Enrolled: 18/20

=== Grade Calculations ===
Regular course score 88 = B
Lab course score 85 = C (needs 75 minimum)
Online course score 95 = A (92+ required)
Honors course score 88 = C (85+ required for B)
```

### 💪 Challenges (Optional Bonus)

**Level 1 - Add features:**
- Add student roster tracking
- Add drop() method with logic for each course type
- Add waitlist for full courses

**Level 2 - Business logic:**
- Add credit hour calculation (full time vs part time)
- Add course prerequisites
- Add semester scheduling

**Level 3 - Full system:**
- Create Student class that enrolls in multiple courses
- Create grade calculation across all courses
- Add GPA tracking and academic standing

---

## Summary

These exercises progress from:
1. **Single hierarchy** (Exercise 1: Animals) → understand basic inheritance/polymorphism
2. **Parent method extension** (Exercise 2: Bank) → using `super` effectively
3. **Real patterns** (Exercise 3: Widgets) → Flutter preparation
4. **Complex systems** (Exercise 4: Courses) → professional-level OOP

**Next:** Review [solutions/solution_05.dart](solutions/solution_05.dart) for reference implementations 📚
