# Lesson 1.2: Variables and Data Types

## What is a Variable?

A variable is like a **labeled box** where you can store information. You give the box a name, put something inside it, and you can look inside that box anytime you want.

For example:
- A box labeled `age` might store the number `20`
- A box labeled `name` might store the text `"Alex"`
- A box labeled `isStudent` might store `true` or `false`

## What are Data Types?

Data types describe **what kind of information** you're storing. Dart has several basic types:

### The Main Data Types

| Type | What It Stores | Examples | Real-Life Use |
|:---|:---|:---|:---|
| **`int`** | Whole numbers (no decimals) | `5`, `-10`, `1000` | Age, count, score |
| **`double`** | Numbers with decimals | `3.14`, `9.99`, `-2.5` | Height, weight, price |
| **`String`** | Text (words, sentences) | `"Hello"`, `'World'`, `"I am 20"` | Names, messages, addresses |
| **`bool`** | True or False (yes or no) | `true`, `false` | Is user logged in? Is student? |

Think of types like containers:
- Use `int` when you count things
- Use `double` when you measure things precisely
- Use `String` when you work with words
- Use `bool` when you ask yes/no questions

## Creating Variables: Two Ways

### Method 1: Explicit Typing (Recommended for Beginners)

With explicit typing, you **tell Dart exactly what type** you want to store:

```dart
int age = 20;              // This box stores only whole numbers
String name = "Sachin";    // This box stores only text
double height = 5.9;       // This box stores only numbers with decimals
bool isStudent = true;     // This box stores only true or false
```

Once you create a box with a type, you can only store that type in it:

```dart
int myAge = 20;
myAge = 25;           // ✅ Allowed! Changing age to 25
myAge = "twenty-five"; // ❌ ERROR! Can't store text in a number box!
```

### Method 2: Type Inference (Let Dart Figure It Out)

You can use the keyword `var` and Dart will automatically figure out what type you meant:

```dart
var city = "Lucknow";  // Dart sees text, so it knows city is a String
var count = 42;        // Dart sees a number, so it knows count is an int
var price = 19.99;     // Dart sees a decimal, so it knows price is a double
```

Dart remembers the type it figured out:

```dart
var message = "Hello";
message = "Goodbye";   // ✅ Still text, so OK
message = 123;         // ❌ ERROR! Was a String, can't change to number
```

### Method 3: Dynamic (The Wild Card)

The `dynamic` type can store **anything**, but it's risky because you lose type safety:

```dart
dynamic weirdVariable = "I am text";
weirdVariable = 100;        // ✅ Allowed (but confusing!)
weirdVariable = true;       // ✅ Also allowed
```

**When to use:**
- ❌ **Avoid for beginners!** It makes code harder to understand
- ✅ Use only when you really don't know what type something will be

## Naming Variables: The Rules

Variable names must follow these rules:

```dart
int myAge = 20;           // ✅ Can use letters and numbers
String firstName = "Alex"; // ✅ Can use underscores
int age2 = 25;            // ✅ Can have numbers, but not at start

int 2age = 20;            // ❌ Can't start with a number
String first-name = "Alex"; // ❌ Can't use hyphens
int my age = 20;          // ❌ Can't have spaces
```

**Best Practices:**
- Use **camelCase**: `myVariable`, `firstName`, `isStudent`
- Use **descriptive names**: `age` instead of `a`, `userName` instead of `u`
- Use **lowercase** at the start: `age` not `Age`

## Real Example: Creating a Student Profile

Let's create variables to store information about a student:

```dart
void main() {
  // Student information
  String studentName = "Alex";
  int studentAge = 20;
  double gpa = 3.85;
  bool isFullTime = true;
  
  print("Student Name: $studentName");
  print("Age: $studentAge");
  print("GPA: $gpa");
  print("Full-time Student: $isFullTime");
}
```

Output:
```
Student Name: Alex
Age: 20
GPA: 3.85
Full-time Student: true
```

## String Interpolation: Combining Text and Variables

Often, you want to put variable values **inside** text. That's called string interpolation.

### Method 1: Using `$variableName`

```dart
String name = "Sachin";
int age = 20;

print("My name is $name");      // Output: My name is Sachin
print("I am $age years old");   // Output: I am 20 years old
```

### Method 2: Using `${expression}` for Calculations

When you need to do math or calculations, use curly braces:

```dart
int a = 10;
int b = 5;

print("The sum is ${a + b}");      // Output: The sum is 15
print("The product is ${a * b}");  // Output: The product is 50
```

Without the braces, it won't work:
```dart
print("The sum is $a + b");  // Output: The sum is 10 + b (wrong!)
print("The sum is ${a + b}"); // Output: The sum is 15 (correct!)
```

## Putting It All Together

```dart
void main() {
  // Declare variables
  String college = "VIT";
  int year = 2;
  double cgpa = 8.5;
  bool isCoder = true;
  
  // Use them
  print("College: $college");
  print("Year: $year");
  print("CGPA: $cgpa");
  print("Is a coder: $isCoder");
  
  // Combine information
  print("\\nI study at $college in year $year with a CGPA of $cgpa");
  print("Am I a coder? $isCoder");
}
```

Output:
```
College: VIT
Year: 2
CGPA: 8.5
Is a coder: true

I study at VIT in year 2 with a CGPA of 8.5
Am I a coder? true
```

## Common Mistakes to Avoid

### ❌ Forgetting to Initialize
```dart
int age;      // Created but empty
print(age);   // ERROR! age doesn't have a value yet
```

### ✅ Initialize Immediately
```dart
int age = 0;     // Now it has a value
print(age);      // OK!
```

### ❌ Forgetting to Declare Type
```dart
myVariable = 20;   // ERROR! Dart doesn't know what type this should be
```

### ✅ Always Specify Type or Use var
```dart
int myVariable = 20;  // Explicit type
var myVariable = 20;  // Type inference
```

## Summary

- Variables are **boxes** that store information
- Every variable has a **type** that describes what it can store
- Use **explicit typing** (`int`, `String`, etc.) or **type inference** (`var`)
- Use **string interpolation** (`$variable` or `${expression}`) to combine text and variables
- Follow **naming conventions**: camelCase, descriptive names
- Always **initialize** variables before using them
